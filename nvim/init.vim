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
call minpac#add('itchyny/lightline.vim')
call minpac#add('maximbaz/lightline-ale')
call minpac#add('mgee/lightline-bufferline')
call minpac#add('morhetz/gruvbox')

" ============================== MINPAC
command! Mpup call minpac#update()
command! Mpclean call minpac#clean()
 
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

" ============================== NERDTREE NERDCOMMENT
let g:NERDSpaceDelims=1
let g:NERDDefaultAlign='left'
let g:NERDTreeWinSize=40

" ============================== LIGHTLINE / BUFFERLINE / ALE
let g:lightline = {
\ 'colorscheme': 'gruvbox',
\ 'active': {
\   'left':  [ [ 'mode', 'paste'],
\              [ 'linter_errors', 'linter_warnings', 'linter_ok' ],
\              [ 'gitbranch', 'readonly', 'relativepath', 'modified' ]],
\   'right': [ [ 'gitbranch' ]],
\ },
\ 'tabline': {
\   'left':  [ [ 'buffers'] ],
\ },
\ }

let g:lightline.component_expand = {
\  'linter_warnings': 'lightline#ale#warnings',
\  'linter_errors': 'lightline#ale#errors',
\  'linter_ok': 'lightline#ale#ok',
\  'buffers': 'lightline#bufferline#buffers',
\  'gitbranch': 'fugitive#head',
\ }

let g:lightline.component_type = {
\  'linter_warnings': 'warning',
\  'linter_errors': 'error',
\  'buffers': 'tabsel',
\ }

" ============================== LIGHTLINE-BUFFERLINE
let g:lightline#bufferline#read_only='ro'
let g:lightline#bufferline#shorten_path=0
let g:lightline#bufferline#show_number=2

" ============================== ALE
let g:ale_linters = {
\  'javascript': ['eslint'],
\  'ruby': ['rubocop'],
\}


" ============================== SETTINGS ==============================

filetype plugin indent on
syntax on

" colorscheme
let g:gruvbox_contrast_dark="hard"
let g:gruvbox_contrast_light="hard"
colorscheme gruvbox

" netrw
let g:netrw_liststyle = 3
let g:netrw_banner = 0

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
set scrolloff=10
set shiftwidth=2
set showtabline=2   " for lightline-bufferline
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

" netrw window
nnoremap e :e.<CR>
nnoremap E :E<CR>

" capitalize current word
nnoremap ,U mqviwU`q

" lower case current word
nnoremap ,u mqviwUviw~`q

" delete buffer
nnoremap ,d :bd<CR>

" delete all buffers
nnoremap ,D :bd <C-a><CR>

" edit .vimrc etc.
nnoremap ,ev :e ~/.config/nvim/init.vim<CR>
nnoremap ,sv :so ~/.config/nvim/init.vim<CR>

" npm
nnoremap ,n :!npm run 

" chrome
nnoremap ,ch :!google-chrome 

" indentation
nnoremap > >>
nnoremap < <<

" redo
nnoremap U <C-r>

" turn a snake into a camel
nnoremap ,+ mmviw:s/\%V_\(.\)/\U\1/g<CR>:nohlsearch<CR>`m

" turn a camel into a snake
nnoremap ,_ mmviw:s/\%V\(\u\)/_\L\1/g<CR>:nohlsearch<CR>`m

" turn a function into a closure
nnoremap ,( :s/function/const/ef(i = f)a =>

" reload
nnoremap ,R :e!<CR>

" goyo mode
nnoremap ,gy :Goyo<CR>

" move by one line
nnoremap j gj
nnoremap k gk

" find and replace word under cursor
nnoremap ,rw :%s/<c-r><c-w>//g<left><left>
" find and replace word
nnoremap ,rr :%s//g<Left><Left>

" fzf (see fzf under plugins)
nnoremap ,f :Files<CR>
nnoremap ,a :Find 
nnoremap ,F :FindCurrent<CR>
nnoremap ,b :Buffers<CR>

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

" redraw screen
nnoremap ,x :redraw!<CR>

" run make
nnoremap <F5> :wa<CR>:make<CR>

" show only this file (close others)
nnoremap ,o <C-W>o<CR>

" select all
nnoremap ,sa ggVG

" 0 is easier. ^ is more useful.
nnoremap 0 ^
nnoremap ^ 0

" ALE next error
nmap <silent> ,es <Plug>(ale_next_wrap)

" next/prev buffer
nnoremap <S-Tab> :bprev<CR>
nnoremap <Tab> :bnext<CR>

" alternate buffer
nnoremap <BS> <C-^>

" lightline
nmap ,1 <Plug>lightline#bufferline#go(1)
nmap ,2 <Plug>lightline#bufferline#go(2)
nmap ,3 <Plug>lightline#bufferline#go(3)
nmap ,4 <Plug>lightline#bufferline#go(4)
nmap ,5 <Plug>lightline#bufferline#go(5)
nmap ,6 <Plug>lightline#bufferline#go(6)
nmap ,7 <Plug>lightline#bufferline#go(7)
nmap ,8 <Plug>lightline#bufferline#go(8)
nmap ,9 <Plug>lightline#bufferline#go(9)
nmap ,0 <Plug>lightline#bufferline#go(10)
