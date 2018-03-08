" ============================== PLUGINS ==============================

packadd minpac
call minpac#init()
call minpac#add('k-takata/minpac', {'type': 'opt'})
call minpac#add('airblade/vim-gitgutter')
call minpac#add('junegunn/goyo.vim')
call minpac#add('junegunn/limelight.vim')
call minpac#add('scrooloose/nerdcommenter')
call minpac#add('ervandew/supertab')
call minpac#add('christoomey/vim-tmux-navigator')
call minpac#add('SirVer/ultisnips')
call minpac#add('bit101/bit-ultisnips')
call minpac#add('junegunn/fzf')
call minpac#add('junegunn/fzf.vim')
call minpac#add('tpope/vim-fugitive')
call minpac#add('tpope/vim-repeat')
call minpac#add('sheerun/vim-polyglot')
call minpac#add('w0rp/ale')
call minpac#add('morhetz/gruvbox')
call minpac#add('jeetsukumaran/vim-filebeagle')
call minpac#add('junegunn/vim-peekaboo')

" ============================== MINPAC
function! MinpacReset()
  call minpac#update()
  call minpac#clean()
endfunction
command! MinPac call MinpacReset()
 
" ============================== LIMELIGHT/GOYO/SPELL
let g:limelight_conceal_ctermfg = 240 
augroup GoyoGroup
  autocmd!
  autocmd! User GoyoEnter call GoyoStart()
  autocmd! User GoyoLeave call GoyoEnd()
augroup END

function! GoyoStart()
  Limelight
  set spell
endfunction

function! GoyoEnd()
  Limelight!
  set nospell
endfunction

" ============================== FZF/RIPGREP
" ========== files
let $FZF_DEFAULT_COMMAND = 'rg --files --hidden'

" ========== words
command! -bang -nargs=* Find call fzf#vim#grep(
\ 'rg --column --line-number --no-heading --ignore-case --hidden --follow --color "always" '.shellescape(<q-args>),
\ 1,
\ fzf#vim#with_preview('right:50%:wrap', '?'))

" ========== word under cursor
command! -bang -nargs=* FindCurrent call fzf#vim#grep(
\ 'rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --color "always" '.shellescape(expand('<cword>')),
\ 1,
\ fzf#vim#with_preview('right:50%:wrap', '?'))

" ========== most recently used files
command! MRU call fzf#run({
\  'source':  v:oldfiles,
\  'sink':    'e',
\  'options': '-m -x +s',
\  'down':    '40%'})


" ============================== STATUS LINE ==============================

function! LinterStatus() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:word = l:counts.total == 1 ? "LINT ISSUE" : "LINT ISSUES"
  return l:counts.total == 0 ? '[ALL GOOD] ' : printf('[ %s %s ] ', counts.total, word)
endfunction

function! GitBranchStatus()
  return fugitive#head() == "" ? "" : printf("[%s]", fugitive#head())
endfunction

set statusline=
set statusline+=%{LinterStatus()}
set statusline+=%f
set statusline+=%=[%l:%L]
set statusline+=%{GitBranchStatus()}

" ============================== SETTINGS ==============================

filetype plugin indent on
syntax on

" colorscheme
let g:gruvbox_contrast_dark="hard"
let g:gruvbox_contrast_light="hard"
colorscheme gruvbox

" NERDCommenter
let g:NERDSpaceDelims=1
let g:NERDDefaultAlign='left'

set autoindent
set autoread
set background=dark
set backspace=indent,eol,start
set clipboard^=unnamedplus
set colorcolumn=120
set expandtab
set hidden
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
set path+=src
set scrolloff=10
set shiftwidth=2
set shortmess=I
set showtabline=2
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
augroup ReloadGroup
  autocmd!
  autocmd! FocusGained,BufEnter * checktime
augroup END


" ============================== MAPPINGS ==============================
let mapleader = " "

" pseudo-leader , mappings

" delete buffer
nnoremap ,d :bd<CR>

" delete all buffers
nnoremap ,D :bd <C-a><CR>

" capitalize current word
nnoremap ,U mqviwU`q

" lower case current word
nnoremap ,u mqviwUviw~`q

" edit .vimrc etc.
nnoremap ,ev :e ~/.config/nvim/init.vim<CR>
nnoremap ,sv :so ~/.config/nvim/init.vim<CR>

" npm
nnoremap ,n :!npm run 

" reload
nnoremap ,R :e!<CR>

" goyo mode
nnoremap ,gy :Goyo<CR>

" find and replace word under cursor
nnoremap ,rw :%s/<c-r><c-w>//g<left><left>

" find and replace word
nnoremap ,rr :%s//g<Left><Left>

" fzf (see fzf under plugins)
nnoremap ,f :Files<CR>
nnoremap ,a :Find 
nnoremap ,F :FindCurrent<CR>
nnoremap ,b :Buffers<CR>
nnoremap ,of :MRU<CR>

" git
nnoremap ,gs :Gstatus<CR>
nnoremap ,gb :Gblame<CR>
nnoremap ,gd :Gdiff<CR>
nnoremap ,gc :Gcommit<CR>
nnoremap ,gp :Git push<CR>

" quit all
nnoremap ,q :qa<CR>

" no highlight
nnoremap ,hh :nohlsearch<CR>

" show invisible chars
nnoremap ,l :set list!<CR>

" select all
nnoremap ,sa ggVG

" ALE next error
nmap <silent> ,es <Plug>(ale_next_wrap)

" non-leader mappings ==========

" run make
nnoremap <F5> :wa<CR>:make<CR>

" this only gets hit by accident
nnoremap Q <Nop>

" redo
nnoremap U <C-r>

" move by one visual line
nnoremap j gj
nnoremap k gk

" 0 is easier. ^ is more useful.
nnoremap 0 ^
nnoremap ^ 0

" next/prev buffer
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprev<CR>
nnoremap <BS> :b#<CR>

" filebeagle
nnoremap bd :ClipPathname<CR>:!rm <C-r>+
nnoremap bm :ClipPathname<CR>:!mv <C-r>+ <C-r>+



" ============================== COMMANDS ==============================

" turn a snake into a camel
command! SnakeToCamel normal mmviw:s/\%V_\(.\)/\U\1/g<CR>:nohlsearch<CR>`m

" turn a camel into a snake
command! CamelToSnake normal mmviw:s/\%V\(\u\)/_\L\1/g<CR>:nohlsearch<CR>`m

" turn a function into a closure
command! FuncToClosure normal :s/function/const/ef(i = f)a =>

