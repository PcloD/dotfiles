# export some shit
export PATH=$PATH:/usr/local/go/bin:$HOME/go/bin:$HOME/.local/bin
export TERM=xterm-256color
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64/bin
export GOPATH="$HOME/go"

# antigen some shit
source ~/antigen.zsh
antigen use oh-my-zsh
antigen bundle git
antigen bundle ssh-agent
antigen apply

# source some shit!
source ~/.prompt.zsh
source ~/.aliases

# vim shit
export VISUAL=nvim
export EDITOR=nvim
alias vim="nvim"
alias vi="nvim"

# fzf shit
# [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh # do i need this?
export FZF_DEFAULT_COMMAND="rg --files --follow --hidden"

# rbenv shit
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# vim binding shit
bindkey -v 
bindkey '^P' up-history
bindkey '^N' down-history
export KEYTIMEOUT=1

# direnv shit
eval "$(direnv hook zsh)"

# linux shit
if [[ $CURRENT_OS == 'Linux' ]]; then
  setxkbmap -option caps:escape
fi

# notarize shit
if [[ $CURRENT_OS == 'OS X' ]]; then
  [ -f ~/.weblaunchers ] && source ~/.weblaunchers
  [ -f ~/.notarize_aliases ] && source ~/.notarize_aliases
  export PGDATA="/usr/local/pgsql/data"
fi
