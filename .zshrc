# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME=""

# Add new line before each prompt
precmd() { 
    print ""
}

# Add a separator between command and output
preexec() {
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
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
fpath=($fpath "/Users/antoinekahlouche/.zfunctions")

# Aliases
alias vi="nvim -c :NvimTreeOpen"
alias ls="ls --color -alh"
alias oc="opencode"

# Bun path
export PATH=$PATH:$HOME/.bun/bin

# Fzf cd
cd_to_dir() {
    local selected_dir
    selected_dir=$(fd -type d . ~/ws/ | fzf)
    if [[ -n "$selected_dir" ]]; then
        cd "$selected_dir" || return 1
    fi
}
alias cdd='cd_to_dir'
