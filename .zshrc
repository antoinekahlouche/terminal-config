# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME=""

# Add new line before each prompt
precmd() {
	print ""
}

# Which plugins would you like to load?
plugins=()
if [[ -d "${ZSH_CUSTOM:-$ZSH/custom}/plugins/zsh-autosuggestions" ]]; then
	plugins+=(zsh-autosuggestions)
fi

ZSH_AUTOSUGGEST_STRATEGY=(history completion)
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#5c6370"

if [[ -f "$ZSH/oh-my-zsh.sh" ]]; then
	source "$ZSH/oh-my-zsh.sh"
else
	autoload -Uz compinit
	compinit
fi

setopt prompt_subst

git_prompt_branch() {
	local branch
	branch=$(git symbolic-ref --quiet --short HEAD 2>/dev/null || git rev-parse --short HEAD 2>/dev/null) || return
	printf ' (%s)' "$branch"
}

git_prompt_branch_color() {
	git rev-parse --is-inside-work-tree >/dev/null 2>&1 || return

	if git diff --quiet --ignore-submodules HEAD -- 2>/dev/null; then
		printf '%%F{green}'
	else
		printf '%%F{yellow}'
	fi
}

PROMPT='(%m) %B%F{blue}%~%f%b$(git_prompt_branch_color)$(git_prompt_branch)%f -> '

# User configuration
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                   # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion
fpath=($fpath "$HOME/.zfunctions")

# Path
export PATH="$PATH:$HOME/.bun/bin"
export PATH="$HOME/.local/bin:$PATH"
[[ -f "$HOME/.atuin/bin/env" ]] && . "$HOME/.atuin/bin/env"

# Aliases
vi() {
	if [[ $# -eq 0 ]]; then
		nvim .
	else
		nvim "$@"
	fi
}
if command -v eza >/dev/null 2>&1; then
	alias ls="eza -a1 --icons=always --group-directories-first"
fi
if command -v zoxide >/dev/null 2>&1; then
	alias cd="z"
fi
alias oc="opencode"
alias lg="lazygit"
alias ld="lazydocker"
alias dh="diffhub"
alias n="clear"
alias q="exit"
alias dc="docker compose"

if command -v zoxide >/dev/null 2>&1; then
	eval "$(zoxide init zsh)"
fi
if command -v atuin >/dev/null 2>&1; then
	eval "$(atuin init zsh)"
fi
