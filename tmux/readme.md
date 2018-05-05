1. Install tmux: https://github.com/tmux/tmux/wiki
2. For vim integration, install `vim-tmux-navigator` https://github.com/christoomey/vim-tmux-navigator in vim.
   The snippets in this `.tmux.conf` will handle the tmux side of things.
3. Symlink `.tmux.conf` to the home directory using `sudo ln -s ...`.
4. `tmux_send` is a script that will send a command to tmux panel 1 - useful in make files.
   Symlink it to somewhere in your path, like `~/.local/bin/`
