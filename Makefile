clean-nvim:
	rm -rf ~/.local/share/nvim/
	brew reinstall neovim

deploy-ghosty:
	cp -f ghosty.config ~/Library/Application\ Support/com.mitchellh.ghostty/config

deploy-nvim:
	rm -rf ~/.config/nvim
	cp -Rf ./nvim/ ~/.config/nvim/

deploy-zsh:
	cp -f .zshrc ~/.zshrc
	exec zsh

deploy:
	make deploy-ghosty
	make deploy-nvim
	make deploy-zsh
