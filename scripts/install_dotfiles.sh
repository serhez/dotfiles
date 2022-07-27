#!/bin/bash
# vim: ai:ts=4:sw=4:noet
# Install SH development environment
# Supports MacOS and Arch Linux

echo -n "Do you want to install Neovim and it's config? (y/n)"
read -r nvim
while [[ "$nvim" != "y" ]] && [[ "$nvim" != "n" ]]; do
    echo -n "Please, answer with \"y\" for yes or \"n\" for no: do you want to install Neovim and it's config?"
    read -r nvim
done

echo -n "Installing dependencies..."

mkdir ~/.config

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    # Linux
    distribution=$(grep '^NAME' /etc/os-release)
    case $distribution in
        NAME="Arch Linux")
			pacman -S bash
			pacman -S alacritty
            pacman -S git
			pacman -S github-cli
			pacman -S glab
            pacman -S python3
            pacman -S go
            pacman -S gcc
            pacman -S gnu-sed
            pacman -S fd
            pacman -S ripgrep
            pacman -S luajit
            pacman -S node
            pacman -S lazygit
            pacman -S k9s
            pacman -S exa
            pacman -S bat
            pacman -S starship
            pacman -S htop
			pacman -S zsh-syntax-highlighting
			pacman -S zsh-autosuggestions
			pacman -S mockery
            ;;
        *)
            echo -n "Your Linux distribution is not supported by the installer at this moment."
            exit 1
            ;;
    esac

    # Generic installs for Linux
    curl -R -O http://www.lua.org/ftp/lua-5.3.5.tar.gz
    tar -zxf lua-5.3.5.tar.gz
    cd lua-5.3.5
    sudo make install
    cd ..
    sudo rm -r lua-5.3.5

    go get github.com/jesseduffield/lazydocker

    npm install -g mprocs

elif [[ "$OSTYPE" == "darwin"* ]]; then
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

    # MacOS
    architecture=$(uname -m)
    case $architecture in
        # Mac Intel silicon
        x86_64)
			brew install bash
			brew install alacritty
            brew install git
			brew install gh
			brew install glab
            brew install python3
            brew install golang
            brew install gcc
            brew install gnu-sed
            brew install fd
            brew install ripgrep
            brew install luajit
            brew install luarocks
            brew install node
            brew install jesseduffield/lazygit/lazygit
            brew install pvolok/mprocs/mprocs
            brew install jesseduffield/lazydocker/lazydocker
            brew install k9s
            brew install exa
            brew install bat
            brew install starship
            brew install htop
			brew install zsh-syntax-highlighting
			brew install zsh-autosuggestions
			brew install mockery
			brew install --cask rectangle
            ;;

        # Mac Apple silicon
        arm64)
			arch -arm64 brew install bash
			arch -arm64 brew install alacritty
            arch -arm64 brew install git
			arch -arm64 brew install gh
			arch -arm64 brew install glab
            arch -arm64 brew install python3
            arch -arm64 brew install golang
            arch -arm64 brew install gcc
            arch -arm64 brew install gnu-sed
            arch -arm64 brew install fd
            arch -arm64 brew install ripgrep
            arch -arm64 brew install --HEAD luajit
            arch -arm64 brew install luarocks
            arch -arm64 brew install node
            arch -arm64 brew install jesseduffield/lazygit/lazygit
            arch -arm64 brew install pvolok/mprocs/mprocs
            arch -arm64 brew install jesseduffield/lazydocker/lazydocker
            arch -arm64 brew install k9s
            arch -arm64 brew install exa
            arch -arm64 brew install bat
            arch -arm64 brew install starship
            arch -arm64 brew install htop
			arch -arm64 brew install zsh-syntax-highlighting
			arch -arm64 brew install zsh-autosuggestions
			arch -arm64 brew install mockery
			arch -arm64 brew install --cask rectangle
            ;;
    esac

    # Generic installs for MacOS
	xcode-select --install

	# Generic settings for MacOS
	sudo /usr/sbin/DevToolsSecurity -enable
	sudo dscl . append /Groups/_developer GroupMembership $(whoami)
	defaults write com.apple.screencapture type png
	defaults write com.apple.dock autohide-delay -float 0
	defaults write com.apple.dock autohide-time-modifier -float 0.5
	defaults write com.apple.dock persistent-apps -array-add '{"tile-type"="small-spacer-tile";}'
	defaults write com.apple.dock persistent-apps -array-add '{"tile-type"="small-spacer-tile";}'
	killall Dock

else
    echo -n "Your OS is not supported by the installer at this moment."
    exit 1
fi

# Generic installs for all OS's

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
mv -r ~/.oh-my-zsh ~/.config

curl https://sh.rustup.rs -sSf | sh
cargo install --git https://github.com/chmln/nvim-ctrl

npm install -g speed-test
npm install -g tldr

# FIX: Not working for Apple silicon: go install github.com/asciimoo/wuzz@latest
go install github.com/go-delve/delve/cmd/dlv@latest

python3 -m pip install --upgrade pip
python3 -m pip install cmakelang
python3 -m pip install debugpy

echo -n "Configuring the environment..."

cp -r ../scripts ~
cp ./.zprofile ~
cp ./.zshrc ~
cp ./.zshenv ~
cp ./.tmux.conf ~
cp ./.nuxtrc ~

mkdir ~/.config
cp -r ./.config/alacritty ~/.config
cp -r ./.config/gh ~/.config
cp -r ./.config/htop ~/.config
cp -r ./.config/mprocs ~/.config

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    cp -r ./.config/awesome ~/.config
    cp -r ./.config/picom ~/.config
    cp -r ./.config/ranger ~/.config
    cp -r ./.config/rofi ~/.config

    cp -r ./.Xresources.d ~
    cp ./.Xresources ~
fi

if [[ "$nvim" == "y" ]]; then
	echo -n "Installing and configuring Neovim..."
	git clone https://github.com/serhez/nvim-conf
	cd nvim-conf
	sudo make install
	cd ..
	sudo rm -r nvim-conf
fi

echo -n "Done! Your environment has been configured."
exit 0
