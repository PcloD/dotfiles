These are my dot files. There are many like them, but these are mine. They are my life. I must master them as I must master my life.  Without me my dotfiles are useless.  Without my dotfiles, I am useless.

OK, enough of that. Obviously, this setup is specific to me and my personal work habits. You're not going to copy them and use them as-is. But hopefully there is a neat trick or two that you can pick up by looking them over.

They are in a constant state of change. I doubt I go 2-3 days without tweaking some aspect of them. I add some new trick or plugin I see on line. Stuff I don't use gets deleted. Some of them need more work than others. Creative criticism and suggestions are welcome.

One amazing thing about this config is that I use the exact same setup on Ubuntu at home and Macos at work. The only different file is my `.gitconfig` which uses a different email address. But I broke the rest of the config out into a `.gittools` file that can be included by both versions. I guess I could have done the opposite - include a `.gitidentity` file that only contains the email address. A future improvement!

I'm currently using `zsh` as my shell. This is the most recent change, and I'm really loving it. Wish I had switched years ago. I'm still pretty dependent on `oh-my-zsh` for a lot of functionality. I'd like to eventually see if I can understand enough of `zsh` itself to do without `oh-my-zsh`. Or maybe try `antigen`. But still a noob.

I use `tmux` for terminal tabs and splits rather than using the built-in terminal tabs. And of course for session management. `vim-tmux-navigator` makes navigating between `vim` splits and `tmux` splits a breeze. My `.tmux.conf` needs the most work out of any of the files here. I set it up months ago and really haven't needed to touch it much since.

I switched over to `vim` and then `neovim` months ago as well. That's where the meat of the config files here are. It's also where the bulk of the ongoing changes are likely to be. I use a few more plugins than I'd really like to be using, but I'm really happy with all of them. Need to install `minpac` manually first so that it can handle all the other package management. This setup has dependencies on a couple of external tools as well: `fzf` and `ripgrep` for search. And then there is `eslint` and `rubocop` for linting `JavaScript` and `Ruby` code.

The `misc` folder has my aliases, ignore files and git configuration. As well as my old `.bashrc` in case I ever need to jump over to using `bash` again.

Todos:
* Clean up `.tmux.conf`.
* Learn enough about `zsh` to not depend on `oh-my-zsh`.
* Look into other syntax management / highlighting solutions in `vim`.
