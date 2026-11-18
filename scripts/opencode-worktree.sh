#!/usr/bin/env bash
set -euo pipefail

fail() { printf '%s\n' "$*" >&2; exit 1; }
clean() {
  [[ -z "$(git -C "$1" status --porcelain --untracked-files=all)" ]] ||
    fail "Worktree has uncommitted or untracked changes: $1"
}
main_tree() {
  local line path=""
  while IFS= read -r line; do
    case "$line" in
      "worktree "*) path=${line#worktree } ;;
      "branch refs/heads/main") printf '%s\n' "$path"; return ;;
    esac
  done < <(git -c core.quotePath=false worktree list --porcelain)
  fail "No worktree has main checked out."
}
task_tree() {
  task=$(git rev-parse --show-toplevel)
  branch=$(git symbolic-ref --quiet --short HEAD) || fail "Detached HEAD is not supported."
  [[ "$branch" != main ]] || fail "Cannot finish main."
  main=$(main_tree)
  [[ "$task" != "$main" ]] || fail "Task and main worktrees must differ."
}
report() {
  printf 'main=%s\ntask=%s\nbranch=%s\n' "$main" "$task" "$branch"
}

case "${1:-}" in
  start)
    slug=${2:-}
    [[ "$slug" =~ ^[a-z0-9]+(-[a-z0-9]+)*$ ]] || fail "Supply a lowercase ASCII task slug."
    main=$(main_tree)
    clean "$main"
    task="$(dirname "$main")/$slug"
    [[ ! -e "$task" && ! -L "$task" ]] || fail "Task path already exists: $task"
    if git show-ref --verify --quiet "refs/heads/$slug"; then
      fail "Branch already exists: $slug"
    fi
    git -C "$main" pull --ff-only
    git -C "$main" worktree add -b "$slug" "$task" main
    branch=$slug
    report
    ;;
  inspect)
    task_tree
    report
    if [[ -z "$(git status --porcelain --untracked-files=all)" ]] &&
       [[ "$(git rev-list --count "main..$branch")" == 0 ]]; then
      clean "$main"
      printf 'action=cleanup\n'
    else
      printf 'action=review\n'
    fi
    ;;
  integrate)
    task_tree
    clean "$task"
    clean "$main"
    report
    git -C "$main" checkout main
    git -C "$main" pull --ff-only
    git -C "$main" merge --no-edit "$branch"
    ;;
  cleanup|publish)
    action=$1
    task=${2:?Supply the saved task worktree path}
    task=$(cd "$task" && pwd -P)
    branch=${3:?Supply the saved task branch}
    main=$(git rev-parse --show-toplevel)
    [[ "$(git symbolic-ref --quiet --short HEAD)" == main ]] || fail "Run this step from main."
    [[ "$branch" != main && "$task" != "$main" ]] || fail "Cannot remove main."
    [[ "$(git -C "$task" rev-parse --show-toplevel)" == "$task" ]] || fail "Invalid task path."
    [[ "$(git -C "$task" symbolic-ref --quiet --short HEAD)" == "$branch" ]] ||
      fail "Task branch does not match."
    clean "$main"
    clean "$task"
    git merge-base --is-ancestor "$branch" main || fail "Task branch is not merged into main."
    if [[ "$action" == publish ]]; then
      git push
    fi
    git worktree remove "$task"
    git branch -d "$branch"
    report
    ;;
  *)
    fail "Usage: bash opencode-worktree.sh {start SLUG|inspect|integrate|cleanup TASK BRANCH|publish TASK BRANCH}"
    ;;
esac
