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

command! MRU call fzf#run({
\  'source':  v:oldfiles,
\  'sink':    'e',
\  'options': '-m -x +s',
\  'down':    '40%'})

" ============================== NERDTREE NERDCOMMENT
let g:NERDSpaceDelims=1
let g:NERDDefaultAlign='left'

" ============================== LIGHTLINE / BUFFERLINE / ALE
let g:lightline = {
\ 'colorscheme': 'gruvbox',
\ 'active': {
\   'left':  [ [ 'mode', 'paste'],
\              [ 'linter_errors', 'linter_warnings', 'linter_ok' ],
\              [ 'readonly', 'relativepath', 'modified' ]],
\   'right': [ [ 'gitbranch' ]],
\ },
\ 'tabline': {
\   'left': [ [ 'relativepath' ] ],
\ },
\ }

let g:lightline.component_expand = {
\  'linter_warnings': 'lightline#ale#warnings',
\  'linter_errors': 'lightline#ale#errors',
\  'linter_ok': 'lightline#ale#ok',
\  'gitbranch': 'fugitive#head',
\ }

let g:lightline.component_type = {
\  'linter_warnings': 'warning',
\  'linter_errors': 'error',
\ }

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

" vim anywhere (copy all, exit)
nnoremap ,va ggvG$"+y:q!<CR>

" trailing spaces and multiple lines
function! KillWhiteSpace()
  %s/ \+$//eg
  %s/\n\{3,\}/\r\r/eg
  %s/{\n\{2,\}/{\r/eg
endfunction
nnoremap ,w :call KillWhiteSpace()<CR>
" nnoremap ,w :%s/ \+$//eg<CR>:%s/\n\{3,\}/\r\r/eg<CR>

" quit, no save
nnoremap ,! :q!

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

" move by one visual line
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

" redraw screen
nnoremap ,x :redraw!<CR>

" run make
nnoremap <F5> :wa<CR>:make<CR>

" show only this file (close others)
nnoremap ,ow <C-W>o<CR>

" select all
nnoremap ,sa ggVG

" yank all
nnoremap ,ya ggVGy

" 0 is easier. ^ is more useful.
nnoremap 0 ^
nnoremap ^ 0

" ALE next error
nmap <silent> ,es <Plug>(ale_next_wrap)

" next/prev buffer
nnoremap <Tab> :b#<CR>
nnoremap ,<Tab> :bnext<CR>

" filebeagle
nnoremap bd :ClipPathname<CR>:!rm <C-r>+
nnoremap bm :ClipPathname<CR>:!mv <C-r>+ <C-r>+

