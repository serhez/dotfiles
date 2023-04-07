#!/bin/bash
# vim: ai:ts=4:sw=4:noet
# Install SH development environment
# Supports MacOS and Arch Linux

cp ~/.nuxtrc ./
cp ~/.lintr ./
cp ~/.tmux.conf ./
cp ~/.zprofile ./
cp ~/.zshenv ./
cp ~/.zshrc ./
cp ~/.condarc ./
cp ~/.config/starship.toml ./.config/

# Remove all content before copying
rm -r ./.config/alacritty
cp -r ~/.config/alacritty ./.config
rm -r ./.config/tmux
mkdir ./.config/tmux
cp ~/.config/tmux/tmux.conf ./.config/tmux
cp -r ~/.config/tmux/colorschemes ./.config/tmux
rm -r ./.config/htop
cp -r ~/.config/htop ./.config
rm -r ./.config/kitty
cp -r ~/.config/kitty ./.config
rm -r ./.config/wezterm
cp -r ~/.config/wezterm ./.config
rm -r ./.config/mprocs
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
elif [[ "$OSTYPE" == "darwin"* ]]; then
	rm -r ./.config/rectangle
	cp -r ~/.config/rectangle ./.config
	rm -r ./.config/karabiner
	cp -r ~/.config/karabiner ./.config
fi
