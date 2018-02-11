function! plugins#init() abort 
  packadd minpac
  call minpac#init()
  call minpac#add('k-takata/minpac', {'type': 'opt'})
  call minpac#add('airblade/vim-gitgutter')
  call minpac#add('junegunn/goyo.vim')
  call minpac#add('itchyny/lightline.vim')
  call minpac#add('junegunn/limelight.vim')
  call minpac#add('scrooloose/nerdcommenter')
  call minpac#add('scrooloose/nerdtree')
  call minpac#add('ervandew/supertab')
  call minpac#add('christoomey/vim-tmux-navigator')
  call minpac#add('MarcWeber/vim-addon-mw-utils')
  call minpac#add('garbas/vim-snipmate')
  call minpac#add('tomtom/tlib_vim')
  call minpac#add('junegunn/fzf')
  call minpac#add('junegunn/fzf.vim')
  call minpac#add('bit101/snips')
  call minpac#add('tpope/vim-fugitive')
  call minpac#add('tpope/vim-repeat')
  call minpac#add('yggdroot/indentLine')
  call minpac#add('sheerun/vim-polyglot')
  call minpac#add('w0rp/ale')
  call minpac#add('maximbaz/lightline-ale')
  call minpac#add('unblevable/quick-scope')
  call minpac#add('mgee/lightline-bufferline')

  " Plugin settings ================
  command! Mpup call minpac#update()
  command! Mpclean call minpac#clean()
   
  " limelight/goyo
  let g:limelight_conceal_ctermfg = 'gray'
  let g:limelight_conceal_ctermfg = 240
  autocmd! User GoyoEnter Limelight
  autocmd! User GoyoLeave Limelight!

  " fzf/ripgrep
  " files
  let $FZF_DEFAULT_COMMAND = 'rg --files'
  " words
  command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)

  " quick-scope
  let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

  " NERD tree and comment
  let g:NERDSpaceDelims=1
  let g:NERDDefaultAlign='left'
  let g:NERDTreeWinSize=40

  " lightline / ALE / buffer
  let g:lightline = {
  \ 'active': {
  \   'left':  [ [ 'mode', 'paste'],
  \              [ 'linter_errors', 'linter_warnings', 'linter_ok' ],
  \              [ 'gitbranch', 'readonly', 'relativepath', 'modified' ]],
  \   'right': [ [ 'lineinfo' ],
  \              [ 'percent' ]],
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

  " ALE
  let g:ale_linters = {
  \  'javascript': ['eslint'],
  \  'ruby': ['rubocop'],
  \}

  " lightline-bufferline
  set hidden  " allow buffer switching without saving
  set showtabline=2  " always show tabline
  let g:lightline#bufferline#read_only='ro'
  let g:lightline#bufferline#shorten_path=0
  let g:lightline#bufferline#show_number=2

endfunction
