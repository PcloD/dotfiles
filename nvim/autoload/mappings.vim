function! mappings#init() abort
  let g:mapleader=","

  " capitalize current word
  nnoremap <Leader>U mqviwU`q
  " lower case current word
  nnoremap <Leader>u mqviwUviw~`q

  nnoremap <Leader>D :bd <C-a><CR>

  " edit .vimrc etc.
  nnoremap <Leader>ev :e ~/.config/nvim<CR>

  " source .vimrc
  nnoremap <Leader>sv :call ReloadConfigs()<CR>:so ~/.config/nvim/init.vim<CR>

  function! ReloadConfigs()
    so ~/.config/nvim/autoload/mappings.vim
    so ~/.config/nvim/autoload/plugins.vim
    so ~/.config/nvim/autoload/settings.vim
  endfunction

  " nerdtree
  nnoremap <F2> :NERDTreeToggle<CR>
  nnoremap <F3> :NERDTreeFind<CR>

  " npm
  nnoremap <Leader>n :!npm run 

  " increment/decrement numbers
  nnoremap + <C-a>
  nnoremap - <C-x>

  " indentation
  nnoremap > >>
  nnoremap < <<

  " redo
  nnoremap U <C-r>

  " chrome
  nnoremap <Leader>ch :!google-chrome 

  " turn a snake into a camel
  nnoremap <Leader>+ mmviw:s/\%V_\(.\)/\U\1/g<CR>:nohlsearch<CR>`m
  " turn a camel into a snake
  nnoremap <Leader>_ mmviw:s/\%V\(\u\)/_\L\1/g<CR>:nohlsearch<CR>`m

  " turn a function into a closure
  nnoremap <Leader>( :s/function/const/ef(i = f)a =>

  " reload
  nnoremap <Leader>R :e!<CR>

  " immersive mode
  nnoremap <Leader>gy :Goyo<CR>

  " move by one line
  nnoremap j gj
  nnoremap k gk
  nnoremap <Leader>gg :nnoremap j gj<CR>:nnoremap k gk<CR>
  nnoremap <Leader>gx :nunmap j<CR>:nunmap k<CR>

  " find and replace word under cursor
  nnoremap <Leader>rw :%s/<c-r><c-w>//g<left><left>
  " find and replace word
  nnoremap <Leader>rr :%s//g<Left><Left>

  " fzf 
  nnoremap <Leader>f :Files<CR>
  nnoremap <Leader>a :Find 
  nnoremap <Leader>F :FindCurrent<CR>
  nnoremap <Leader>b :Buffers<CR>

  " git
  nnoremap <Leader>gs :Gstatus<CR>
  nnoremap <Leader>gb :Gblame<CR>
  nnoremap <Leader>gl :GitGutterLineHighlightsToggle<CR>
  nnoremap <Leader>gd :Gdiff<CR>
  nnoremap <Leader>gc :Gcommit<CR>
  nnoremap <Leader>gp :Git push<CR>
  " git add change
  nmap <Leader>ga <Plug>GitGutterStageHunk
  " git revert change
  nmap <Leader>gr <Plug>GitGutterUndoHunk
  " git unstage file
  nnoremap <Leader>gu :Git reset HEAD %<CR>

  " misc
  " quit all
  nnoremap <Leader>q :qa<CR>
  " no highlight
  nnoremap <Leader>hh :nohlsearch<CR>
  " show invisible chars
  nnoremap <Leader>l :set list!<CR>
  nnoremap <Leader>x :redraw!<CR>
  nnoremap <F5> :wa<CR>:make<CR>
  " show only this file (close others)
  nnoremap <Leader>o <C-W>o<CR>
  " select all
  nnoremap <Leader>sa ggVG
  " show current column
  nnoremap <Leader>co :set cursorcolumn!<CR>

  " 0 is easier. ^ is more useful.
  nnoremap 0 ^
  nnoremap ^ 0

  " eslint next error
  nmap <silent> <Leader>es <Plug>(ale_next_wrap)

  " next/prev buffer
  nnoremap <S-Tab> :bprev<CR>
  nnoremap <Tab> :bnext<CR>
  nnoremap <BS> <C-^>

  " delete buffer
  nnoremap <Leader>d :bd<CR>

  " lightline
  nmap <Leader>1 <Plug>lightline#bufferline#go(1)
  nmap <Leader>2 <Plug>lightline#bufferline#go(2)
  nmap <Leader>3 <Plug>lightline#bufferline#go(3)
  nmap <Leader>4 <Plug>lightline#bufferline#go(4)
  nmap <Leader>5 <Plug>lightline#bufferline#go(5)
  nmap <Leader>6 <Plug>lightline#bufferline#go(6)
  nmap <Leader>7 <Plug>lightline#bufferline#go(7)
  nmap <Leader>8 <Plug>lightline#bufferline#go(8)
  nmap <Leader>9 <Plug>lightline#bufferline#go(9)
  nmap <Leader>0 <Plug>lightline#bufferline#go(10)

  augroup filetype_markdown
    autocmd!
    autocmd BufNewFile,BufFilePre,BufRead *.md set filetype=markdown
    " mark. search 2 chars. [] becomes [*]. [* becomes [. else keep same.
    " return to mark, clear highlight, save file.
    " TODO: make into a function/command
    autocmd FileType markdown nnoremap <buffer> <Space> mq:s/../\= submatch(0) == '[]' ? '[*]' : submatch(0) == '[*' ? '[' : submatch(0)/g<CR>`q:nohlsearch<CR>:w<CR>
  augroup END

endfunction
