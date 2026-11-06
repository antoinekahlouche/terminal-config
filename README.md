# Terminal configuration

Run this command from the repository:

```sh
make deploy
```

`make` runs the same deployment by default. The Makefile detects the platform with `uname`.

- macOS: deploys all configurations, including Ghostty and Lazygit's native application-support path.
- Ubuntu Server: deploys terminal configurations under `${XDG_CONFIG_HOME:-$HOME/.config}` and skips Ghostty.
- Both: installs the Lazygit commit-message helper under `~/.local/bin`.

Deployment copies configuration files. It does not install applications or change your login shell.
Existing configuration files are overwritten. Neovim's configuration is replaced, and OpenCode commands and skills are synchronized with deletion.
Open a new shell after deployment.

OpenCode settings are stored in `opencode.jsonc`. Its terminal interface settings are stored in `opencode.cli.json` and deployed as `opencode/cli.json`.
The interface settings preserve automatic permission acceptance (`session.permissions: "autoaccept"`).
The Mac-specific Orca plugin reference is excluded. Deployment replaces `cli.json`, so configure any local plugins separately afterward.

## Requirements

Install `make` and `rsync` before deployment. On Ubuntu:

```sh
sudo apt-get update
sudo apt-get install make rsync zsh
```

Install the applications you want to use separately: Neovim, Atuin, Lazygit, Delta, OpenCode, Zoxide, and Eza.
The Lazygit commit-message command also requires Codex.
Zsh works without Oh My Zsh, Zoxide, Atuin, or Eza. It enables these integrations when available.
Neovim plugins can require a newer Neovim version than Ubuntu's default package provides.

Individual targets such as `make deploy-nvim` and `make deploy-zsh` are also available.
`make clean-nvim` reinstalls Neovim through Homebrew on macOS or apt on Ubuntu, then removes its local data.

## Tests

Run `make test` with Python 3 installed. Tests deploy into temporary home directories, not your real home.
