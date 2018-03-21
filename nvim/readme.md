0. Dependencies:
   * neovim   https://neovim.io/
   * minpac:  https://github.com/k-takata/minpac
   * ripgrep: https://github.com/BurntSushi/ripgrep
   * fzf:     https://github.com/junegunn/fzf

1. Create spellfile: `~/Dropbox/vimspell/en.utf-8.add`.
   Or use another location. Change location in `autoload/mappings.vim`.

2. Set up linters (eslint, rubocop) as needed.
   Define in `plugins.vim`.

3. `sudo ln -s ~/dotfiles/nvim/init.vim ~/.config/nvim/init.vim`

4. For python-based plugins

  `sudo apt-get install python-dev python-pip python3-dev python3-pip`

And then...

  `pip install --user neovim`
  `pip3 install --user neovim`

