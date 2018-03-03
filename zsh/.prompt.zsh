# git status stuff
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[green]%}["
ZSH_THEME_GIT_PROMPT_SUFFIX="]%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[red]%}✗ %{$fg[green]%}"
ZSH_THEME_GIT_PROMPT_CLEAN=" ✔ "

function zle-line-init zle-keymap-select {
  NORMAL_MODE="%{$fg[yellow]%}[VIM]%{$reset_color%}"
  INSERT_MODE="%{$fg[blue]%}[ZSH]%{$reset_color%}"
  MODE_PROMPT="${${KEYMAP/vicmd/$NORMAL_MODE}/(main|viins)/$INSERT_MODE}"
  PATH_PROMPT="%{$fg[green]%}[%~]%{$reset_color%}"
  GIT_PROMPT=$(git_prompt_info)
  COMMAND_PROMPT="%{$fg[blue]%}%#%{$reset_color%} "

# put it all together
  PROMPT=$'$PATH_PROMPT$COMMAND_PROMPT'
  RPS1=$'$GIT_PROMPT$MODE_PROMPT'
  zle reset-prompt
}
zle -N zle-line-init
zle -N zle-keymap-select


