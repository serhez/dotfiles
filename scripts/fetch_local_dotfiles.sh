#!/bin/bash
# vim: ai:ts=4:sw=4:noet
# Install SH development environment
# Supports MacOS and Arch Linux

cp ~/.nuxtrc ./
cp ~/.tmux.conf ./
cp ~/.zprofile ./
cp ~/.zshenv ./
cp ~/.zshrc ./

# Remove all content before copying
rm -r ./.config/alacritty
cp -r ~/.config/alacritty ./.config
rm -r ./.config/tmux
cp -r ~/.config/tmux ./.config
rm -r ./.config/htop
cp -r ~/.config/htop ./.config
rm -r ./.config/mprocs
cp -r ~/.config/mprocs ./.config
cp -r ~/.config/mprocs ./.config

# Do not remove all content before copying
cp ~/scripts/* ./scripts

# Sensitive (do not use *)
cp ~/.config/gh/config.yml ./.config/gh
cp ~/.config/git/config ./.config/git
cp ~/.config/git/.gitignore_global ./.config/git

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    cp ~/.Xresources ./

	rm -r ./.config/.Xresources.d/colorscheme
    cp -r ~/.config/.Xresources.d/colorscheme ./.Xresources.d
	rm -r ./.config/awesome
    cp -r ~/.config/awesome ./.config
	rm -r ./.config/picom
    cp -r ~/.config/picom ./.config
	rm -r ./.config/ranger
    cp -r ~/.config/ranger ./.config
	rm -r ./.config/rofi
    cp -r ~/.config/rofi ./.config
fi
