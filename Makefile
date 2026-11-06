.DEFAULT_GOAL := deploy

UNAME_S := $(shell uname -s)
XDG_CONFIG_HOME ?= $(HOME)/.config
ifeq ($(strip $(XDG_CONFIG_HOME)),)
XDG_CONFIG_HOME := $(HOME)/.config
endif

ifeq ($(UNAME_S),Darwin)
LAZYGIT_CONFIG_DIR := $(HOME)/Library/Application Support/lazygit
GHOSTTY_TARGET := deploy-ghosty
else ifeq ($(UNAME_S),Linux)
LAZYGIT_CONFIG_DIR := $(XDG_CONFIG_HOME)/lazygit
else
$(error Unsupported platform: $(UNAME_S). Use macOS or Ubuntu Linux)
endif

.PHONY: deploy clean-nvim deploy-editorconfig deploy-ghosty deploy-atuin deploy-lazygit deploy-nvim deploy-zsh deploy-opencode test

clean-nvim:
	@if [ "$(UNAME_S)" = Darwin ]; then \
		brew reinstall neovim; \
	else \
		sudo apt-get install --reinstall neovim; \
	fi
	rm -rf "$(HOME)/.local/share/nvim/"

deploy-editorconfig:
	cp -f .editorconfig "$(HOME)/.editorconfig"

ifeq ($(UNAME_S),Darwin)
deploy-ghosty:
	mkdir -p "$(HOME)/Library/Application Support/com.mitchellh.ghostty"
	cp -f ghosty.config "$(HOME)/Library/Application Support/com.mitchellh.ghostty/config"
else
deploy-ghosty:
	@echo "Skipping Ghostty on Ubuntu Server."
endif

deploy-atuin:
	mkdir -p "$(XDG_CONFIG_HOME)/atuin"
	cp -f atuin.config "$(XDG_CONFIG_HOME)/atuin/config.toml"

deploy-lazygit:
	mkdir -p "$(LAZYGIT_CONFIG_DIR)" "$(HOME)/.local/bin"
	cp -f lazygit.config "$(LAZYGIT_CONFIG_DIR)/config.yml"
	cp -f codex-commit-message.sh "$(HOME)/.local/bin/codex-commit-message.sh"

deploy-nvim:
	rm -rf "$(XDG_CONFIG_HOME)/nvim"
	mkdir -p "$(XDG_CONFIG_HOME)/nvim"
	cp -R ./nvim/. "$(XDG_CONFIG_HOME)/nvim/"

deploy-zsh:
	cp -f .zshrc "$(HOME)/.zshrc"

deploy-opencode:
	mkdir -p "$(XDG_CONFIG_HOME)/opencode"
	cp -f opencode.jsonc "$(XDG_CONFIG_HOME)/opencode/opencode.jsonc"
	cp -f opencode.cli.json "$(XDG_CONFIG_HOME)/opencode/cli.json"
	mkdir -p "$(XDG_CONFIG_HOME)/opencode/commands" "$(XDG_CONFIG_HOME)/opencode/skills"
	rsync -a --delete ./.agents/commands/ "$(XDG_CONFIG_HOME)/opencode/commands/"
	rsync -a --delete ./.agents/skills/ "$(XDG_CONFIG_HOME)/opencode/skills/"

deploy: deploy-editorconfig deploy-atuin deploy-lazygit $(GHOSTTY_TARGET) deploy-nvim deploy-opencode deploy-zsh
	@echo "Configuration deployed for $(UNAME_S). Open a new shell to load .zshrc."

test:
	python3 -m unittest discover -s tests
