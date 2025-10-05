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
		sudo pacman -S python@3.9
		sudo pacman -S python@3.12
		sudo pacman -S r
		sudo pacman -S go
		sudo pacman -S gcc

		sudo pacman -S elan
		elan-init -y

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

		sudo pacman -S tmux
		git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm

		sudo pacman -S helix
		sudo pacman -S starship
		sudo pacman -S htop
		sudo pacman -S zsh-syntax-highlighting
		sudo pacman -S zsh-autosuggestions
		sudo pacman -S mockery
		sudo pacman -S firefox
		sudo pacman -S glow
		sudo pacman -S git-delta
		sudo pacman -S difftastic
		sudo pacman -S jq
		sudo pacman -S watchman
		sudo pacman -S postman
		sudo pacman -S nvm
		sudo pacman -S fzf
		sudo pacman -S librsvg
		sudo pacman -S libnotify
		sudo pacman -S yq

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
		yay -S sesh-bin
		;;
	*)
		echo "Your Linux distribution is not supported by the installer at this moment."
		exit 1
		;;
	esac

	# Generic installs for Linux

	## Mamba
	curl -Ls https://micro.mamba.pm/api/micromamba/linux-64/latest | tar -xvj bin/micromamba

	## Pixi
	curl -fsSL https://pixi.sh/install.sh | sh

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

	echo >>~/.zprofile
	echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >>~/.zprofile
	eval "$(/opt/homebrew/bin/brew shellenv)"

	brew install bash
	brew install alacritty
	brew install git
	brew install gh
	brew install glab
	brew install python3
	brew install python@3.9
	brew install python@3.12

	brew install micromamba
	/opt/homebrew/opt/micromamba/bin/mamba shell init --shell zsh --root-prefix ~/mamba

	brew install pixi

	brew install r
	brew install golang
	brew install gcc

	brew install elan
	elan-init -y

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

	brew install fontforge

	brew install tmux
	git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

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
	brew install difftastic
	brew install imagemagick
	brew install ghostscript
	brew install jq
	brew install watchman

	brew install nvm
	mkdir ~/.nvm

	brew install fzf
	brew install librsvg
	brew install libnotify
	brew install yq
	brew install sesh

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
	brew install --cask postman
	brew install --cask visual-studio-code

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

	# Rosetta 2
	sudo softwareupdate --install-rosetta --agree-to-license

	# Xcode
	sudo sh -c 'xcode-select -s /Applications/Xcode.app/Contents/Developer && xcodebuild -runFirstLaunch'
	sudo xcodebuild -license
	xcodebuild -downloadPlatform iOS
else
	echo "Your OS is not supported by the installer at this moment."
	exit 1
fi

# Generic installs for all OS's

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
mv ~/.oh-my-zsh ~/.config
bash -c "$(curl --fail --show-error --silent --location https://raw.githubusercontent.com/zdharma-continuum/zinit/HEAD/scripts/install.sh)"

curl https://sh.rustup.rs -sSf | sh
cargo install --locked tree-sitter-cli
cargo install --git https://github.com/chmln/nvim-ctrl
cargo install --locked zellij

npm install -g speed-test
npm install -g tldr

go install github.com/asciimoo/wuzz@latest

python3 -m pip install --upgrade pip
python3 -m pip install --break-system-packages --user libtmux
/usr/bin/python3 -m pip install --upgrade pip
/usr/bin/python3 -m pip install --user -U libtmux
curl -LsSf https://astral.sh/uv/install.sh | sh

luarocks install magick --lua-version=5.1

# Deno
curl -fsSL https://deno.land/install.sh | sh

# CocoaPods
sudo gem install cocoapods

echo "Configuring the environment..."

cp -r ./scripts ~
cp ./.zprofile ~
cp ./.zshrc ~
cp ./.zshenv ~
cp ./.profile ~
cp ./.bash_profile ~
cp ./.bashrc ~
cp ./.condarc ~
cp ./.mambarc ~
cp ./.tmux.conf ~
cp ./.nuxtrc ~
cp ./.lintr ~
cp ./.config/starship.toml ~/.config
cp ./.config/.prettierrc ~/.config

cp -r ./.config/alacritty ~/.config
cp -r ./.config/htop ~/.config
cp -r ./.config/kitty ~/.config
cp -r ./.config/wezterm ~/.config
cp -r ./.config/tmux ~/.config
cp -r ./.config/mprocs ~/.config
cp -r ./.config/helix ~/.config
cp -r ./.config/neovide ~/.config

mkdir ~/.config/git || true
mkdir ~/.config/gh || true
mkdir ~/.config/pixi || true
cp ./.config/git/config ~/.config/git
cp ./.config/git/.gitignore_global ~/.config/git
cp ./.config/gh/config.yml ~/.config/gh
cp ./.config/pixi/config.toml ~/.config/pixi

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
	cp -r ./.config/awesome ~/.config
	cp -r ./.config/picom ~/.config
	cp -r ./.config/ranger ~/.config
	cp -r ./.config/rofi ~/.config

	cp -r ./.Xresources.d ~
	cp -r ./.Xresources ~
elif [[ "$OSTYPE" == "darwin"* ]]; then
	cp -r ./.config/rectangle ~/.config
	cp -r ./.config/karabiner ~/.config

	# MacOS makes /usr/share/terminfo/ read-only, so we need to copy our terminfo files to a custom dir
	curl -LO https://invisible-island.net/datafiles/current/terminfo.src.gz &&
		gunzip terminfo.src.gz &&
		tic -xe tmux-256color terminfo.src
	# tmux
	sudo ln -s /opt/homebrew/bin/tmux /usr/local/bin/tmux
	# wezterm
	tempfile=$(mktemp) &&
		curl -o "$tempfile" https://raw.githubusercontent.com/wez/wezterm/master/termwiz/data/wezterm.terminfo &&
		tic -x -o ~/.terminfo "$tempfile" &&
		rm "$tempfile"
	# kitty
	ln -h -f -s -- /Applications/kitty.app/Contents/Resources/terminfo/78/xterm-kitty ~/.terminfo/78/xterm-kitty
	# alacritty
	ln -h -f -s -- /Applications/Alacritty.app/Contents/Resources/61/alacritty ~/.terminfo/61/alacritty
	ln -h -f -s -- /Applications/Alacritty.app/Contents/Resources/61/alacritty-direct ~/.terminfo/61/alacritty-direct
fi

# Fix npm bug
sudo chown -R 501:20 "$HOME/.npm"

# Silence "last login" message
touch ~/.hushlogin

# conda init zsh # now using mamba

# Fonts
cd ~/.config || exit 1
# git clone https://github.com/serhez/fonts.git
# cd fonts || exit 1
# wget https://raw.githubusercontent.com/ryanoasis/nerd-fonts/refs/heads/master/font-patcher
# chmod +x font-patcher
# wget https://raw.githubusercontent.com/ryanoasis/nerd-fonts/refs/heads/master/glyphnames.json
# mkdir src
# # TODO: download the src/glyphs folder from the nerd-fonts repo using https://download-directory.github.io/ and place it in the fonts/src/glyphs folder
# # This?
# wget -O src/glyphs.zip https://github.com/ryanoasis/nerd-fonts/archive/refs/heads/master.zip && unzip src/glyphs.zip -d src
# # TODO: download original JetBrains Mono font and install them from https://www.jetbrains.com/lp/mono/# and install them by clickling on the downloaded .ttf files
# python3 font-patcher ~/Library/Fonts/JetBrainsMono-Bold.ttf -s -c -out jetbrains
# python3 font-patcher ~/Library/Fonts/JetBrainsMono-BoldItalic.ttf -s -c -out jetbrains
# python3 font-patcher ~/Library/Fonts/JetBrainsMono-ExtraBold.ttf -s -c -out jetbrains
# python3 font-patcher ~/Library/Fonts/JetBrainsMono-ExtraBoldItalic.ttf -s -c -out jetbrains
# python3 font-patcher ~/Library/Fonts/JetBrainsMono-ExtraLight.ttf -s -c -out jetbrains
# python3 font-patcher ~/Library/Fonts/JetBrainsMono-ExtraLightItalic.ttf -s -c -out jetbrains
# python3 font-patcher ~/Library/Fonts/JetBrainsMono-Italic.ttf -s -c -out jetbrains
# python3 font-patcher ~/Library/Fonts/JetBrainsMono-Light.ttf -s -c -out jetbrains
# python3 font-patcher ~/Library/Fonts/JetBrainsMono-LightItalic.ttf -s -c -out jetbrains
# python3 font-patcher ~/Library/Fonts/JetBrainsMono-Medium.ttf -s -c -out jetbrains
# python3 font-patcher ~/Library/Fonts/JetBrainsMono-MediumItalic.ttf -s -c -out jetbrains
# python3 font-patcher ~/Library/Fonts/JetBrainsMono-Regular.ttf -s -c -out jetbrains
# python3 font-patcher ~/Library/Fonts/JetBrainsMono-SemiBold.ttf -s -c -out jetbrains
# python3 font-patcher ~/Library/Fonts/JetBrainsMono-SemiBoldItalic.ttf -s -c -out jetbrains
# python3 font-patcher ~/Library/Fonts/JetBrainsMono-Thin.ttf -s -c -out jetbrains
# python3 font-patcher ~/Library/Fonts/JetBrainsMono-ThinItalic.ttf -s -c -out jetbrains
# # TODO: install the created nerd fonts

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
