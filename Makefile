clean:
	rm -rf ~/.local/share/nvim/
	brew reinstall neovim

tmux-kill:
	tmux kill-session -t 0

deploy-alacrity:
	cp -f alacritty.yml ~/.config/alacritty/alacritty.yml

deploy-nvim:
	rm -rf ~/.config/nvim
	cp -Rf ./nvim/ ~/.config/nvim/

deploy-tmux:
	cp -f .tmux.conf ~/.tmux.conf

deploy-zsh:
	cp -f .zshrc ~/.zshrc
	# source ~/.zshrc

deploy:
	make deploy-alacrity
	make deploy-nvim
	make deploy-tmux
	make deploy-zsh

