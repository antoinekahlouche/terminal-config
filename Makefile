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

deploy-nvim:
	rm -rf ~/.config/nvim
	cp -Rf ./nvim/ ~/.config/nvim/

deploy-zsh:
	cp -f .zshrc ~/.zshrc
	exec zsh

deploy-opencode:
	mkdir -p ~/.config/opencode
	rm -rf ~/.config/opencode/commands
	mkdir -p ~/.config/opencode/commands
	rsync -av --delete ./.agents/commands/ ~/.config/opencode/commands/
	mkdir -p ~/.config/opencode/skills
	rsync -av --delete ./.agents/skills/ ~/.config/opencode/skills/

deploy:
	make deploy-editorconfig
	make deploy-atuin
	make deploy-ghosty
	make deploy-nvim
	make deploy-opencode
	make deploy-zsh
