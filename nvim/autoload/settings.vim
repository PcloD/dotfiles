function! settings#init() abort
  filetype plugin indent on
  syntax on
  let g:gruvbox_contrast_dark="hard"
  let g:gruvbox_contrast_light="hard"
  colorscheme gruvbox
  set autoindent smartindent
  set autoread
  set background=dark
  set backspace=indent,eol,start
  set clipboard=unnamedplus
  set colorcolumn=120
  set expandtab
  set hlsearch
  set ignorecase
  set incsearch
  set laststatus=2
  set linebreak
  set listchars=tab:→\ ,eol:↲,nbsp:␣,trail:✗,space:·
  set mouse=a
  set nobackup
  set noswapfile
  set noshowmode
  set number
  set shiftwidth=2
  set softtabstop=2
  set spelllang=en_us
  set spellfile=~/Dropbox/vimspell/en.utf-8.add
  set splitright
  set timeoutlen=2000
  set ttimeoutlen=0
  set wildmenu
  " hide matched parens
  let loaded_matchparen=1

  " reload changed file on focus, buffer enter
  autocmd! FocusGained,BufEnter * checktime

endfunction
