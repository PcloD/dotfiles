export ZSH=~/.oh-my-zsh

# ZSH_THEME="candy"

DISABLE_AUTO_TITLE="true"

plugins=(
  git
)

source $ZSH/oh-my-zsh.sh

# my aliases
source ~/.aliases

# let's always use nvim 
export VISUAL=nvim
export EDITOR=nvim
alias vim="nvim"
alias vi="nvim"

# FZF
export FZF_DEFAULT_COMMAND="rg --files --follow --hidden"
alias fzp="fzf --preview='cat {}'"

# nvm stuff
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

# rbenv stuff
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# oops, zsh doesn't seem to know about snaps
export PATH="/snap/bin:$PATH"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f ~/.weblaunchers ] && source ~/.weblaunchers
[ -f ~/.notarize_aliases ] && source ~/.notarize_aliases

eval $(thefuck --alias)

# lets get vim bindings working nicely
bindkey -v 
bindkey '^P' up-history
bindkey '^N' down-history
export KEYTIMEOUT=1

export PGDATA="/usr/local/pgsql/data"

source ~/.prompt.zsh
