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

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="false"


# Which plugins would you like to load?

# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    git
    zsh-autosuggestions
)

ZSH_AUTOSUGGEST_STRATEGY=(history completion)
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#5c6370"

source $ZSH/oh-my-zsh.sh

setopt prompt_subst
ZSH_THEME_GIT_PROMPT_PREFIX="%F{yellow}<"
ZSH_THEME_GIT_PROMPT_SUFFIX=">%f"
PROMPT='%B%F{blue}%~%f%b $(git_prompt_info)
→ '

# User configuration
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
fpath=($fpath "/Users/antoinekahlouche/.zfunctions")

# Aliases
alias vi="nvim"
alias ls="ls --color -alh"

# Bun path
export PATH=$PATH:$HOME/.bun/bin
