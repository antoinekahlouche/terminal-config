clean-nvim:
	rm -rf ~/.local/share/nvim/
	brew reinstall neovim

generate-snippets:
	bun run ./generate-snippets.ts

deploy-ghosty:
	cp -f ghosty.config ~/Library/Application\ Support/com.mitchellh.ghostty/config

deploy-nvim:
	rm -rf ~/.config/nvim
	cp -Rf ./nvim/ ~/.config/nvim/

deploy-zsh:
	cp -f .zshrc ~/.zshrc
	exec zsh

deploy:
	make generate-snippets
	make deploy-ghosty
	make deploy-nvim
	make deploy-zsh
