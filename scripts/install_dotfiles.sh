#!/bin/bash
# vim: ai:ts=4:sw=4:noet
# Install SH development environment
# Supports MacOS and Arch Linux

echo "Do you want to install Neovim and it's config? (y/n)"
read -r nvim
while [[ "$nvim" != "y" ]] && [[ "$nvim" != "n" ]]; do
    echo "Please, answer with \"y\" for yes or \"n\" for no: do you want to install Neovim and it's config?"
    read -r nvim
done

echo "Installing dependencies..."

[[ -d ~/.config ]] || mkdir ~/.config
[[ -d ~/.terminfo ]] || mkdir ~/.terminfo
[[ -d ~/.envs ]] || mkdir ~/.envs

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    # Linux
    distribution=$(grep '^NAME' /etc/os-release)
    case $distribution in
        NAME="Arch Linux")
			sudo pacman -S --needed base-devel
			sudo pacman -S bash
			sudo pacman -S kitty
			sudo pacman -S alacritty
            sudo pacman -S git
			sudo pacman -S github-cli
			sudo pacman -S glab
            sudo pacman -S python3
			sudo pacman -S r
            sudo pacman -S go
            sudo pacman -S gcc
            sudo pacman -S gnu-sed
            sudo pacman -S fd
            sudo pacman -S zoxide
            sudo pacman -S ripgrep
            sudo pacman -S luajit
            sudo pacman -S node
			sudo pacman -S llvm
			sudo pacman -S boost
			sudo pacman -S hdf5
			sudo pacman -S docker
			sudo pacman -S docker-compose
			sudo pacman -S kubectl
			sudo pacman -S kubernetes-control-plane
            sudo pacman -S lazygit
            sudo pacman -S k9s
            sudo pacman -S eza
			sudo pacman -S most
            sudo pacman -S bat
			sudo pacman -S gnu-tar
			sudo pacman -S wget
			sudo pacman -S helix
            sudo pacman -S starship
            sudo pacman -S htop
			sudo pacman -S zsh-syntax-highlighting
			sudo pacman -S zsh-autosuggestions
			sudo pacman -S mockery
			sudo pacman -S firefox
			sudo pacman -S glow
			sudo pacman -S git-delta

			# Install yay, an AUR package manager
			git clone https://aur.archlinux.org/yay-git.git
			cd yay || exit 1
			makepkg -si
			cd ..
			sudo rm -r yay

			yay -S google-chrome
			yay -S wezterm-git
			yay -S zsh-vi-mode
			yay -S quarto-cli
			yay -S julia-bin
            ;;
        *)
            echo "Your Linux distribution is not supported by the installer at this moment."
            exit 1
            ;;
    esac

    # Generic installs for Linux

	## Mamba
	curl -Ls https://micro.mamba.pm/api/micromamba/linux-64/latest | tar -xvj bin/micromamba

	## Lua
    curl -R -O http://www.lua.org/ftp/lua-5.3.5.tar.gz
    tar -zxf lua-5.3.5.tar.gz
    cd lua-5.3.5 || exit 1
    sudo make install
    cd ..
    sudo rm -r lua-5.3.5

    go get github.com/jesseduffield/lazydocker

    npm install -g mprocs

# MacOS
elif [[ "$OSTYPE" == "darwin"* ]]; then
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

	brew install bash
	brew install alacritty
	brew install git
	brew install gh
	brew install glab
	brew install python3
	brew install micromamba
	brew install r
	brew install golang
	brew install gcc
	brew install gnu-sed
	brew install xquartz
	brew install fd
	brew install zoxide
	brew install ripgrep
	brew install luajit
	brew install luarocks
	brew install node
	brew install llvm
	brew install boost
	brew install hdf5
	brew install docker
	brew install --cask docker
	brew install docker-compose
	brew install docker-completion
	brew install kubernetes-cli
	brew install jesseduffield/lazygit/lazygit
	brew install pvolok/mprocs/mprocs
	brew install jesseduffield/lazydocker/lazydocker
	brew install k9s
	brew install eza
	brew install most
	brew install bat
	brew install gnu-tar
	brew install wget
	brew install helix
	brew install starship
	brew install htop
	brew install pandoc
	brew install zsh-syntax-highlighting
	brew install zsh-autosuggestions
	brew install zsh-vi-mode
	brew install mockery
	brew install glfw
	brew install glow
	brew install git-delta
	brew install imagemagick
	brew install ghostscript

	brew tap wez/wezterm
	brew install --cask wez/wezterm/wezterm-nightly
	brew install --cask kitty
	brew install --cask rectangle
	brew install --cask notion
	brew install --cask cheatsheet
	brew install --cask raycast
	brew install --cask google-chrome
	brew install --cask firefox
	brew install --cask neovide
	brew install --cask quarto
	brew install --cask julia
	brew install --cask karabiner-elements
	brew install --cask alt-tab
	brew install --cask numi
	brew install --cask zotero
	brew install --cask unnaturalscrollwheels

    # Generic installs for MacOS
	xcode-select --install

	# Generic settings for MacOS
	ln -h -f -s -- /Applications/Alacritty.app/Contents/Resources/61/alacritty ~/.terminfo/61/alacritty
	ln -h -f -s -- /Applications/Alacritty.app/Contents/Resources/61/alacritty-direct ~/.terminfo/61/alacritty-direct
	sudo /usr/sbin/DevToolsSecurity -enable
	sudo dscl . append /Groups/_developer GroupMembership "$(whoami)"
	defaults write com.apple.screencapture type jpg
	defaults write com.apple.dock autohide-delay -float 0
	defaults write com.apple.dock autohide-time-modifier -float 0.5
	defaults write com.apple.dock persistent-apps -array-add '{"tile-type"="small-spacer-tile";}'
	defaults write com.apple.dock persistent-apps -array-add '{"tile-type"="small-spacer-tile";}'
	defaults write com.apple.dock persistent-apps -array-add '{"tile-type"="small-spacer-tile";}'
    defaults write com.apple.Finder AppleShowAllFiles true
	# defaults write -g KeyRepeat -int 250
	# defaults write -g InitialKeyRepeat -int 2500
	killall Dock
    killall Finder

else
    echo "Your OS is not supported by the installer at this moment."
    exit 1
fi

# Generic installs for all OS's

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
mv -r ~/.oh-my-zsh ~/.config

curl https://sh.rustup.rs -sSf | sh
cargo install --git https://github.com/chmln/nvim-ctrl

npm install -g speed-test
npm install -g tldr

go install github.com/asciimoo/wuzz@latest

python3 -m pip install --upgrade pip

luarocks install magick --lua-version=5.1

echo "Configuring the environment..."

cp ./scripts ~
cp ./.zprofile ~
cp ./.zshrc ~
cp ./.zshenv ~
cp ./.condarc ~
cp ./.mambarc ~
cp ./.tmux.conf ~
cp ./.nuxtrc ~
cp ./.lintr ~
cp ./.config/starship.toml ~/.config

cp ./.config/alacritty ~/.config
cp ./.config/gh ~/.config
cp ./.config/htop ~/.config
cp ./.config/kitty ~/.config
cp ./.config/wezterm ~/.config
cp ./.config/mprocs ~/.config
cp ./.config/helix ~/.config
cp ./.config/neovide ~/.config

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    cp ./.config/awesome ~/.config
    cp ./.config/picom ~/.config
    cp ./.config/ranger ~/.config
    cp ./.config/rofi ~/.config

    cp ./.Xresources.d ~
    cp ./.Xresources ~
elif [[ "$OSTYPE" == "darwin"* ]]; then
	cp ./.config/rectangle ~/.config
	cp ./.config/karabiner ~/.config

	# NOTE: MacOS makes /usr/share/terminfo/ read-only, so we need to copy our terminfo files to a custom dir
	# tmux
	curl -LO https://invisible-island.net/datafiles/current/terminfo.src.gz \
		&& gunzip terminfo.src.gz \
		&& tic -xe tmux-256color terminfo.src
	# wezterm
	tempfile=$(mktemp) \
		&& curl -o "$tempfile" https://raw.githubusercontent.com/wez/wezterm/master/termwiz/data/wezterm.terminfo \
		&& tic -x -o ~/.terminfo "$tempfile" \
		&& rm "$tempfile"
	# kitty
	ln -h -f -s -- /Applications/kitty.app/Contents/Resources/terminfo/78/xterm-kitty ~/.terminfo/78/xterm-kitty
	# alacritty
	ln -h -f -s -- /Applications/Alacritty.app/Contents/Resources/61/alacritty ~/.terminfo/61/alacritty
	ln -h -f -s -- /Applications/Alacritty.app/Contents/Resources/61/alacritty-direct ~/.terminfo/61/alacritty-direct
fi

# conda init zsh # now using mamba

if [[ "$nvim" == "y" ]]; then
	echo "Installing and configuring Neovim..."
	git clone https://github.com/serhez/nvim-conf
	cd nvim-conf || exit 1
	sudo make install
	cd ..
	sudo rm -r nvim-conf
fi

echo "Done! Your environment has been configured."

echo "Some recommended downloads are:"
echo "  - Beekeeper Studio [https://www.beekeeperstudio.io/get]: a GUI-based SQL editor and manager"
echo "  - Obsidian [https://obsidian.md]: a note-taking app"

exit 0
