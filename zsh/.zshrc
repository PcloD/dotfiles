# let's export some shit
export PATH=$PATH:/usr/local/go/bin:$HOME/go/bin:$HOME/.local/bin
export PGDATA="/usr/local/pgsql/data"
export TERM=xterm-256color
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64/bin
export GOPATH="$HOME/keith/go"

# let's antigen some shit
# not sure if this is better than flat out oh-my-zsh, but at least I know exactly what's loading now.
# see if I can evantually get rid of some of this. ideally, all done manually without any oh-my shit
source ~/antigen.zsh
antigen use oh-my-zsh
antigen bundle git
antigen bundle ssh-agent
antigen apply
source ~/.prompt.zsh

# let's source some shit!
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f ~/.cargo/env ] && source ~/.cargo/env
[ -f ~/.weblaunchers ] && source ~/.weblaunchers
[ -f ~/.notarize_aliases ] && source ~/.notarize_aliases
source ~/.aliases

# Vim shit
export VISUAL=nvim
export EDITOR=nvim
alias vim="nvim"
alias vi="nvim"

# FZF shit
export FZF_DEFAULT_COMMAND="rg --files --follow --hidden"
alias fzp="fzf --preview='cat {}'"

# rbenv shit
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# Vim binding shit
bindkey -v 
bindkey '^P' up-history
bindkey '^N' down-history
export KEYTIMEOUT=1

# direnv shit
eval "$(direnv hook zsh)"

# nvm shit
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

