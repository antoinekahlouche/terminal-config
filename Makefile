clean-nvim:
	rm -rf ~/.local/share/nvim/
	brew reinstall neovim

deploy-editorconfig:
	cp -f .editorconfig ~/.editorconfig

deploy-ghosty:
	cp -f ghosty.config ~/Library/Application\ Support/com.mitchellh.ghostty/config

deploy-nvim:
	rm -rf ~/.config/nvim
	cp -Rf ./nvim/ ~/.config/nvim/

deploy-zsh:
	cp -f .zshrc ~/.zshrc
	exec zsh

deploy-opencode:
	mkdir -p ~/.config/opencode
	cp -f opencode.json ~/.config/opencode/opencode.json
	rm -rf ~/.config/opencode/commands
	mkdir -p ~/.config/opencode/commands
	rsync -av --delete ./commands/ ~/.config/opencode/commands/
	cp -f ./AGENTS.md ~/.config/opencode/AGENTS.md

deploy:
	make deploy-editorconfig
	make deploy-ghosty
	make deploy-nvim
	make deploy-opencode
	make deploy-zsh
