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


