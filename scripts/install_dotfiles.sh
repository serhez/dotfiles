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

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    # Linux
    distribution=$(grep '^NAME' /etc/os-release)
    case $distribution in
        NAME="Arch Linux")
			sudo pacman -S --needed base-devel
			sudo pacman -S bash
			sudo pacman -S alacritty
            sudo pacman -S git
			sudo pacman -S github-cli
			sudo pacman -S glab
            sudo pacman -S python3
            sudo pacman -S go
            sudo pacman -S gcc
            sudo pacman -S gnu-sed
            sudo pacman -S fd
            sudo pacman -S ripgrep
            sudo pacman -S luajit
            sudo pacman -S node
			sudo pacman -S docker
			sudo pacman -S docker-compose
			sudo pacman -S kubectl
			sudo pacman -S kubernetes-control-plane
            sudo pacman -S lazygit
            sudo pacman -S k9s
            sudo pacman -S exa
            sudo pacman -S bat
            sudo pacman -S starship
            sudo pacman -S htop
			sudo pacman -S zsh-syntax-highlighting
			sudo pacman -S zsh-autosuggestions
			sudo pacman -S mockery
			sudo pacman -S firefox

			# Install yay, an AUR package manager
			git clone https://aur.archlinux.org/yay-git.git
			cd yay
			makepkg -si
			cd ..
			sudo rm -r yay

			yay -S google-chrome
			yay -S zsh-vi-mode
            ;;
        *)
            echo "Your Linux distribution is not supported by the installer at this moment."
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
			brew install docker
			brew install --cask docker
			brew install docker-compose
			brew install docker-completion
			brew install kubernetes-cli
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
			brew install zsh-vi-mode
			brew install mockery
			brew install --cask rectangle
			brew install --cask notion
			brew install --cask cheatsheet
			brew install --cask raycast
			brew install --cask google-chrome
			brew install --cask firefox
			brew install --cask neovide
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
			arch -arm64 brew install docker
			arch -arm64 brew install --cask docker
			arch -arm64 brew install docker-compose
			arch -arm64 brew install docker-completion
			arch -arm64 brew install kubernetes-cli
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
			arch -arm64 brew install zsh-vi-mode
			arch -arm64 brew install mockery
			arch -arm64 brew install --cask rectangle
			arch -arm64 brew install --cask notion
			arch -arm64 brew install --cask cheatsheet
			arch -arm64 brew install --cask raycast
			arch -arm64 brew install --cask google-chrome
			arch -arm64 brew install --cask firefox
			arch -arm64 brew install --cask neovide
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

# FIX: Not working for Apple silicon: go install github.com/asciimoo/wuzz@latest

python3 -m pip install --upgrade pip

echo "Configuring the environment..."

cp -r ./scripts ~
cp ./.zprofile ~
cp ./.zshrc ~
cp ./.zshenv ~
cp ./.tmux.conf ~
cp ./.nuxtrc ~

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
elif [[ "$OSTYPE" == "darwin"* ]]; then
	cp -r ./.config/rectangle ~/.config
fi

if [[ "$nvim" == "y" ]]; then
	echo "Installing and configuring Neovim..."
	git clone https://github.com/serhez/nvim-conf
	cd nvim-conf
	sudo make install
	cd ..
	sudo rm -r nvim-conf
fi

echo "Done! Your environment has been configured."

echo "Some recommended downloads are:"
echo "  - Beekeeper Studio [A GUI-based SQL editor and manager]: https://www.beekeeperstudio.io/get"

exit 0
