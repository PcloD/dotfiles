# let's export some shit
export PATH=$PATH:/usr/local/go/bin:/snap/bin
export ZSH=~/.oh-my-zsh
export PGDATA="/usr/local/pgsql/data"
export TERM=xterm-256color

# let's source some shit!
source $ZSH/oh-my-zsh.sh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f ~/.cargo/env ] && source ~/.cargo/env
[ -f ~/.weblaunchers ] && source ~/.weblaunchers
[ -f ~/.notarize_aliases ] && source ~/.notarize_aliases
source ~/.prompt.zsh
source ~/.aliases

# misc shit
DISABLE_AUTO_TITLE="true"

plugins=(
  git
)

# Vim shit
export VISUAL=nvim
export EDITOR=nvim
alias vim="nvim"
alias vi="nvim"

# FZF shit
export FZF_DEFAULT_COMMAND="rg --files --follow --hidden"
alias fzp="fzf --preview='cat {}'"

# nvm shit
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

# rbenv shit
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# Vim binding shit
bindkey -v 
bindkey '^P' up-history
bindkey '^N' down-history
export KEYTIMEOUT=1

