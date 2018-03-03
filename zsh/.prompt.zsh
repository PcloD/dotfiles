# git status stuff
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[green]%}["
ZSH_THEME_GIT_PROMPT_SUFFIX="]%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[red]%}✗ %{$fg[green]%}"
ZSH_THEME_GIT_PROMPT_CLEAN=" ✔ "

function zle-line-init zle-keymap-select {
  VIM_MODE="%{$fg[yellow]%}[NORMAL]%{$reset_color%}"
  PATH_PROMPT="%{$fg[white]%}[%~]%{$reset_color%}"
  GIT_PROMPT=$(git_prompt_info)
  COMMAND_PROMPT="%{$fg[yellow]%}%#%{$reset_color%} "

# put it all together
  PROMPT=$'$PATH_PROMPT$GIT_PROMPT$COMMAND_PROMPT'
  RPS1='${${KEYMAP/vicmd/$VIM_MODE}/(main|viins)/}'
  zle reset-prompt
}
zle -N zle-line-init
zle -N zle-keymap-select


