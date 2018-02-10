function! settings#init() abort
  filetype plugin on
  syntax on
  colorscheme dante
  set autoindent
  set autoread
  set background=dark
  set backspace=indent,eol,start
  set colorcolumn=120
  set exrc
  set hlsearch
  set ignorecase
  set incsearch
  set laststatus=2
  set linebreak
  set listchars=tab:→\ ,eol:↲,nbsp:␣,trail:✗,space:·
  set mouse=a
  set nobackup
  set noswapfile
  set noro
  set noshowmode
  set number
  set ruler
  set spelllang=en_us
  set spellfile=~/Dropbox/vimspell/en.utf-8.add
  set splitright
  set tabstop=2 softtabstop=0 expandtab shiftwidth=2 smarttab autoindent smartindent
  set timeoutlen=2000
  set ttimeoutlen=0
  set wildmenu
  " hide matched parens
  let loaded_matchparen=1

  " reload changed file on focus, buffer enter
  autocmd! FocusGained,BufEnter * checktime

endfunction
