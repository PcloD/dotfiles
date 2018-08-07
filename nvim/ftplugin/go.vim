setlocal noexpandtab
setlocal tabstop=2
setlocal shiftwidth=2
setlocal sts=2

nnoremap <F5> :wa!<CR>:vsplit \| vertical resize 80 \| terminal go run main.go<CR>
inoremap <F5> <Esc>:wa!<CR>:vsplit \| vertical resize 80 \| terminal go run main.go<CR>
nnoremap <F6> :GoBuild<CR>
tnoremap <Esc> <C-\><C-n>
