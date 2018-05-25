" ============================== PLUGINS ==============================
packadd minpac
call minpac#init()
call minpac#add('k-takata/minpac', {'type': 'opt'})   " package management
call minpac#add('tpope/vim-commentary')               " commenting
call minpac#add('ervandew/supertab')                  " tab completion
call minpac#add('christoomey/vim-tmux-navigator')     " tmux integration
call minpac#add('SirVer/ultisnips')                   " snippets
call minpac#add('bit101/bit-ultisnips')               " my snippets
call minpac#add('junegunn/fzf')                       " fuzzy finder for file and text searching
call minpac#add('junegunn/fzf.vim')                   " enhanced fzf integration
call minpac#add('tpope/vim-repeat')                   " lets some commands repeat
" call minpac#add('sheerun/vim-polyglot')               " language support. do I really need this?
call minpac#add('w0rp/ale')                           " linting
call minpac#add('morhetz/gruvbox')                    " color scheme
call minpac#add('fatih/vim-go')
call minpac#add('tpope/vim-fugitive')                 " git

" ============================== MINPAC
function! MinpacReset()
  call minpac#update()
  call minpac#clean()
endfunction
command! MinPac call MinpacReset()
 
" ============================== FZF/RIPGREP
" ========== files
let $FZF_DEFAULT_COMMAND = 'rg --files --hidden'

" ========== words
command! -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --ignore-case --color=always '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview('right:50%', '?'))

" ============================== ALE
let g:ale_lint_on_text_changed = 'never'

" ============================== STATUS LINE ==============================

function! LinterStatus() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  return l:counts.total == 0 ? '  ✔  ' : printf('  PROBLEMS: %s  ', counts.total)
endfunction
set statusline=
set statusline=%#Question#
set statusline+=%{LinterStatus()}
set statusline+=%#StatusLineNC#
set statusline+=[%n]\ %f\ %m%r
set statusline+=%=[line:\ %l/%L][col:\ %03c]

" ============================== SETTINGS ==============================

filetype plugin indent on
syntax on

" vim-go
" let g:go_fmt_command = "goimports"

" colorscheme
let g:gruvbox_contrast_dark="hard"
let g:gruvbox_contrast_light="hard"
colorscheme gruvbox

" vim-go
let g:go_fmt_command = "goimports"

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
set shiftwidth=2
set showtabline=0
set softtabstop=2
set spelllang=en_us
set spellfile=~/Dropbox/vimspell/en.utf-8.add
set splitright
set timeoutlen=2000
set ttimeoutlen=0
set wildmenu

" reload changed file on focus, buffer enter
" helps if file was changed externally.
augroup ReloadGroup
  autocmd!
  autocmd! FocusGained,BufEnter * checktime
augroup END

" =========== cursorline
hi CursorLine ctermfg=NONE ctermbg=NONE
hi CursorLineNR ctermfg=black ctermbg=yellow
set cursorline

" ============================== MAPPINGS ==============================
let mapleader = " "

" close buffer
nnoremap ,d :bd<CR>
" close all buffers
nnoremap ,D :%bd<CR>

" vert split
nnoremap ,v :vs<CR>

" session save/open/remove
nnoremap ,ss :mksession! ~/.config/nvim/sessions/
nnoremap ,so :source ~/.config/nvim/sessions/
nnoremap ,sr :!rm ~/.config/nvim/sessions/

" edit/save .vimrc
nnoremap ,ev :e ~/.config/nvim/init.vim<CR>
nnoremap ,sv :so ~/.config/nvim/init.vim<CR>

" find and replace word
nnoremap ,fr :%s//g<Left><Left>
" find file
nnoremap ,ff :Files<CR>
" find fuzzy
nnoremap ,fg :Rg 
" find buffer
nnoremap ,b :Buffers<CR>

" git
nnoremap ,gb :Gblame<CR>

" quit all
nnoremap ,q :qa<CR>

" show invisible chars
nnoremap ,l :set list!<CR>

" no highlights
nnoremap ,hh :noh<CR>

" select all
nnoremap ,sa ggVG

" ALE next error
nmap <silent> ,es <Plug>(ale_next_wrap)

" kill all windows but current
nnoremap ,x :only<CR>

" close quickfix
nnoremap ,cc :cclose<CR>

" non-leader mappings ==========

" run make
nnoremap <silent> <F5> :wa<CR>:silent make<CR>
inoremap <silent> <F5> <Esc>:wa<CR>:silent make<CR>
nnoremap <silent> <F6> :wa<CR>:silent make clean<CR>
nnoremap <silent> <F7> :wa<CR>:silent make launch<CR>

" these only get hit by accident
nnoremap Q <Nop>
nnoremap q: <Nop>

" redo
nnoremap U <C-r>

" move by one visual line
nnoremap j gj
nnoremap k gk

" 0 is easier. ^ is more useful.
nnoremap 0 ^
nnoremap ^ 0

" explore project dir
nnoremap ,, :Explore .<CR>
" explore dir of current buffer
nnoremap - :Explore<CR>

" go to file using index.js if path is dir
nnoremap gf :call GfIndex('<C-r><C-p>')<CR>

" ============================== COMMANDS ==============================

" turn a snake into a camel
command! SnakeToCamel normal mmviw:s/\%V_\(.\)/\U\1/g<CR>:nohlsearch<CR>`m

" turn a camel into a snake
command! CamelToSnake normal mmviw:s/\%V\(\u\)/_\L\1/g<CR>:nohlsearch<CR>`m

" custom git blame
command! -nargs=* Blame call s:GitBlame()
function! s:GitBlame()
   let cmdline = "git blame --date=short -w " . bufname("%")
   let nline = line(".")
   botright new
   setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile nowrap
   execute "$read !" . cmdline
   execute "normal gg"
   execute "normal dd"
   setlocal nomodifiable
   execute "normal " . nline . "gg"
   execute "set filetype=txt"
endfunction

" go to file using index.js if path is dir
function! GfIndex(filepath)
  let indexpath = a:filepath . "/index.js"
  if isdirectory(a:filepath) && filereadable(indexpath)
    execute "edit" indexpath
  else
    execute "edit" a:filepath
  endif
endfunction
