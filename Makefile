generate-snippets:
	bun run ./generate-snippets.ts

clean-nvim:
	rm -rf ~/.local/share/nvim/
	brew reinstall neovim

deploy-ghosty:
	cp -f ghosty.config ~/Library/Application\ Support/com.mitchellh.ghostty/config

deploy-nvim:
	rm -rf ~/.config/nvim
	cp -Rf ./nvim/ ~/.config/nvim/

deploy-skills:
	mkdir -p ~/.codex/skills ~/.claude/skills
	rsync -a --delete ./skills/ ~/.codex/skills/
	rsync -a --delete ./skills/ ~/.claude/skills/

deploy-zsh:
	cp -f .zshrc ~/.zshrc
	exec zsh

deploy:
	make generate-snippets
	make deploy-ghosty
	make deploy-skills
	make deploy-nvim
	make deploy-zsh
