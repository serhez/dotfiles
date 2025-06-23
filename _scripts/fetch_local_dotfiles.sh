#!/bin/bash
# Install SH development environment
# Supports MacOS and Arch Linux

cp ~/.nuxtrc ./
cp ~/.lintr ./
cp ~/.tmux.conf ./
cp ~/.zprofile ./
cp ~/.zshenv ./
cp ~/.zshrc ./
cp ~/.condarc ./
cp ~/.mambarc ./
cp ~/.config/starship.toml ./.config/
cp ~/.config/.prettierrc ./.config/

# Remove all content before copying
rm -r ./.config/alacritty
cp -r ~/.config/alacritty ./.config
rm -r ./.config/tmux
mkdir ./.config/tmux
cp ~/.config/tmux/tmux.conf ./.config/tmux
cp -r ~/.config/tmux/colorschemes ./.config/tmux
rm -r ./.config/helix
cp -r ~/.config/helix ./.config
rm -r ./.config/htop
cp -r ~/.config/htop ./.config
rm -r ./.config/kitty
cp -r ~/.config/kitty ./.config
rm -r ./.config/wezterm
cp -r ~/.config/wezterm ./.config
rm -r ./.config/mprocs
cp -r ~/.config/mprocs ./.config
rm -r ./.config/neovide
cp -r ~/.config/neovide ./.config

# Do not remove all content before copying
cp ~/scripts/* ./scripts

# Sensitive or cluttered (do not use *)
mkdir -p ./.config/gh
mkdir -p ./.config/git
mkdir -p ./.config/pixi
cp ~/.config/gh/config.yml ./.config/gh/config.yml || true
cp ~/.config/git/config ./.config/git/config || true
cp ~/.config/git/.gitignore_global ./.config/git/.gitignore_global || true
cp ~/.config/pixi/config.toml ./.config/pixi/config.toml || true

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
	if [[ -d ~/.config/rectangle ]]; then
		rm -r ./.config/rectangle
		cp -r ~/.config/rectangle ./.config
	else
		cp -r ~/.config/rectangle ./.config || true
	fi
	if [[ -d ~/.config/karabiner ]]; then
		rm -r ./.config/karabiner
		cp -r ~/.config/karabiner ./.config
	else
		cp -r ~/.config/karabiner ./.config || true
	fi
fi
