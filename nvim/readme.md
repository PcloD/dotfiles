0. Dependencies:
   * neovim   https://github.com/neovim/neovim/wiki/Installing-Neovim 
     // appimage has issues. add apt-repository and install latest.
   * minpac:  https://github.com/k-takata/minpac (clone the repo)
   * ripgrep: https://github.com/BurntSushi/ripgrep (cargo install)
   * fzf:     https://github.com/junegunn/fzf (git install method works fine)

1. Create spellfile: `~/Dropbox/vimspell/en.utf-8.add`.
   Or use another location. Change location in `autoload/mappings.vim`.

2. Set up linters (eslint, rubocop) as needed.
   Define in `plugins.vim`.

3. Python

  `sudo apt-get install python-dev python-pip python3-dev python3-pip`
  `pip install --user neovim`
  `pip3 install --user neovim`

4. Node

  `sudo npm install -g neovim`

5. run `install.sh` to simlink `init.vim` and `ftplugins`
