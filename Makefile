clean-nvim:
	rm -rf ~/.local/share/nvim/
	brew reinstall neovim

deploy-editorconfig:
	cp -f .editorconfig ~/.editorconfig

deploy-ghosty:
	cp -f ghosty.config ~/Library/Application\ Support/com.mitchellh.ghostty/config

deploy-atuin:
	mkdir -p ~/.config/atuin
	cp -f atuin.config ~/.config/atuin/config.toml

deploy-lazygit:
	mkdir -p ~/Library/Application\ Support/lazygit
	cp -f lazygit.config ~/Library/Application\ Support/lazygit/config.yml
	cp -f codex-commit-message.sh ~/Library/Application\ Support/lazygit/codex-commit-message.sh

deploy-nvim:
	rm -rf ~/.config/nvim
	cp -Rf ./nvim/ ~/.config/nvim/

deploy-zsh:
	cp -f .zshrc ~/.zshrc
	exec zsh

deploy-opencode:
	mkdir -p ~/.config/opencode
	cp -f opencode.jsonc ~/.config/opencode/opencode.jsonc
	rm -rf ~/.config/opencode/commands
	mkdir -p ~/.config/opencode/commands
	rsync -av --delete ./.agents/commands/ ~/.config/opencode/commands/
	mkdir -p ~/.config/opencode/skills
	rsync -av --delete ./.agents/skills/ ~/.config/opencode/skills/

deploy:
	make deploy-editorconfig
	make deploy-atuin
	make deploy-lazygit
	make deploy-ghosty
	make deploy-nvim
	make deploy-opencode
	make deploy-zsh
