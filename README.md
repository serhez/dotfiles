# Dotfiles

- OS kernel: **Linux** / **MacOS**
- Distro (Linux): **arch**
- Window manager (Linux): **awesome-wm**
- Window switcher & launcher (Linux): **rofi**
- Shell: **zsh** with **oh-my-zsh**
- Terminal: **wezterm**
- Terminal multiplexer: **tmux**
- Editor / IDE: **neovim**

## Installer

Use `make install` to install all dependencies and configure the environment.

The installer supports Arch Linux and MacOS.

Note that I have not tested the installer too much so it may not work; I don't really care as what really matters to me is that all steps and dependencies of my working environment are recorded somewhere.

## Forking

I have created a script you can use via `make fetch-local` where any changes made to your dotfiles in your system are brought into the repo. In this way, if you are forking this repo and updating it with your own config, you can do this without having to copy-paste every file individually.

## Neovim

I use Neovim as a text editor. I have a [Neovim config](https://github.com/serhez/nvim-conf) which you can also optionally install through the installer (it will ask you).
