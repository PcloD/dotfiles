#! /bin/bash

sudo ln -s ~/dotfiles/misc/.aliases ~/.aliases
sudo ln -s ~/dotfiles/misc/.gitconfig ~/.gitconfig
sudo ln -s ~/dotfiles/misc/.ignore ~/.ignore

sudo ln -s ~/dotfiles/misc/img_view ~/.local/bin/img_view

mkdir -p ~/.config/xfce4/terminal/colorschemes
sudo ln -s ~/dotfiles/misc/gruvbox-dark.theme ~/.config/xfce4/terminal/colorschemes/gruvbox.dark.theme

cp .gitidentity.sample ~/.gitidentity
vim ~/.gitidentity
