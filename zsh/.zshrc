# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
  export ZSH=~/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# ZSH_THEME="candy"

# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# my aliases
source ~/.aliases

# let's always use nvim 
export VISUAL=nvim
export EDITOR=nvim
alias vim="nvim"
alias vi="nvim"

# nvm stuff
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

# rbenv stuff
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# fzf stuff
export FZF_DEFAULT_COMMAND='ag -g "" --path-to-ignore ~/.ignore'

# oops, zsh doesn't seem to know about snaps
export PATH="/snap/bin:$PATH"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f ~/.weblaunchers ] && source ~/.weblaunchers

eval $(thefuck --alias)

# lets get vim bindings working nicely
bindkey -v 
bindkey '^P' up-history
bindkey '^N' down-history
export KEYTIMEOUT=1

# git status stuff
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[green]%}["
ZSH_THEME_GIT_PROMPT_SUFFIX="]%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[red]%}✗ %{$fg[green]%}"
ZSH_THEME_GIT_PROMPT_CLEAN=" ✔ "

function zle-line-init zle-keymap-select {
# what vim mode are we in?
  VIM_MODE="%{$fg[yellow]%}[NORMAL]%{$reset_color%}"
  VIM_PROMPT="${${KEYMAP/vicmd/$VIM_MODE}/(main|viins)/}"

# date, path and git info
  DATE_PROMPT="%{$fg[blue]%}[%*]$reset_color%}"
  PATH_PROMPT="%{$fg[white]%}[%~]%{$reset_color%}"
  GIT_PROMPT=$(git_prompt_info)

# command prompt on new line
  COMMAND_PROMPT="%{$fg[yellow]%}%#%{$reset_color%} "

# put it all together
  PROMPT=$'$DATE_PROMPT$PATH_PROMPT$GIT_PROMPT$VIM_PROMPT\n$COMMAND_PROMPT'
  zle reset-prompt
}
zle -N zle-line-init
zle -N zle-keymap-select


