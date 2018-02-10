" prereqs:
" 0. install neovim
" 1. install minpac: https://github.com/k-takata/minpac
" 2. install ripgrep: https://github.com/BurntSushi/ripgrep
" 3. install fzf: https://github.com/junegunn/fzf
" 4. create spellfile: ~/Dropbox/vimspell/en.utf-8.add
" 5. set up linters (eslint, rubocop) as needed

"~/.config/autoload/plugins.vim
call plugins#init()

"~/.config/autoload/settings.vim
call settings#init()

"~/.config/autoload/mappings.vim
call mappings#init()

