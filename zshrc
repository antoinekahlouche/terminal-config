# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME=""

# Add new line before each prompt
precmd() {
    print ""
}

# Which plugins would you like to load?
plugins=(
    zsh-autosuggestions
)

ZSH_AUTOSUGGEST_STRATEGY=(history completion)
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#5c6370"

source $ZSH/oh-my-zsh.sh

setopt prompt_subst
PROMPT='%B%F{blue}%~%f%b → '

# User configuration
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                   # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion
fpath=($fpath "/Users/antoinekahlouche/.zfunctions")

# Aliases
alias vi="nvim"
alias ls="eza -a1 --icons=always --group-directories-first"
alias cd="z"
alias oc="opencode --model openai/gpt-5.4"
alias ocw="opencode web --hostname 0.0.0.0"
commit() {
    local prompt="/commit"

    if [[ $# -gt 0 ]]; then
        prompt+=" $*"
    fi

    opencode --model openai/gpt-5.4-mini --prompt "$prompt"
}
alias lg="lazygit"
alias ld="lazydocker"
alias n="clear"
alias q="exit"

# Path
export PATH=$PATH:$HOME/.bun/bin
export PATH=$PATH:$HOME/.local/bin

eval "$(zoxide init zsh)"
