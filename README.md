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

OpenCode settings are stored in `opencode/opencode.jsonc`. Its terminal interface settings are stored in `opencode/opencode.cli.json` and deployed as `${XDG_CONFIG_HOME:-$HOME/.config}/opencode/cli.json`.
The interface settings preserve automatic permission acceptance (`session.permissions: "autoaccept"`).

## Files

- `shell/`: Zsh and Atuin configuration.
- `ghosty/`: Ghostty configuration and terminal palette.
- `lazygit/`: Lazygit configuration and Codex commit-message helper.
- `nvim/`: Neovim configuration and `.editorconfig`, also deployed to `~/.editorconfig`.
- `opencode/`: OpenCode configuration and terminal interface settings.
- `commands/`: OpenCode commands.
- `skills/`: OpenCode skills.

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
