## Exports

# Linux
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    export PM_SHARE=/usr/share
    export PM_BIN=/usr/bin

# MacOS
elif [[ "$OSTYPE" == "darwin"* ]]; then
    export TERMINFO=/usr/share/terminfo:$HOME/.terminfo

    architecture=$(uname -m)
    case $architecture in
        # Mac Intel silicon
        x86_64)
            export PM_SHARE=/usr/local/share
            export PM_BIN=/usr/local/bin
            export LDFLAGS="-L/usr/local/opt/llvm/lib"
            export CPPFLAGS="-I/usr/local/opt/llvm/include"
            export CC="/usr/local/opt/llvm/bin/clang"
            export CXX="/usr/local/opt/llvm/bin/clang++"
            export CXX11="/usr/local/opt/llvm/bin/clang++"
            export CXX14="/usr/local/opt/llvm/bin/clang++"
            export CXX17="/usr/local/opt/llvm/bin/clang++"
            export CXX1X="/usr/local/opt/llvm/bin/clang++"
            export JAVA_HOME=/Library/Java/JavaVirtualMachines/zulu-17.jdk/Contents/Home
            ;;

        # Mac Apple silicon
        arm64)
            export PM_SHARE=/opt/homebrew/share
            export PM_BIN=/opt/homebrew/bin
            export LDFLAGS="-L/opt/homebrew/opt/libomp/lib:/opt/homebrew/opt/ruby/lib"
            export CPPFLAGS="-I/opt/homebrew/opt/libomp/include:/opt/homebrew/opt/ruby/include"
            # export CPLUS_INCLUDE_PATH=/Library/Developer/CommandLineTools/usr/include/c++/v1
            export PKG_CONFIG_PATH="/opt/homebrew/opt/ruby/lib/pkgconfig"
            # export CC="/opt/homebrew/bin/gcc-12"
            # export CXX="/opt/homebrew/bin/gcc-12"
            ;;
    esac
fi

export TERMINAL=kitty
export EDITOR=nvim
export VISUAL=nvim
export PAGER=most
export MANPAGER="nvim -c 'Man!' -o -"
export BAT_THEME="TwoDark"
export TERM="tmux-256color"
export XDG_CONFIG_HOME=$HOME/.config

# Path
export PATH=/opt/homebrew/opt/ruby/bin:/opt/homebrew/lib/ruby/gems/3.3.0/bin:/Users/ser/.gem/ruby/3.3.0/bin:/opt/homebrew/bin:/opt/homebrew/opt/llvm/bin:/opt/local/bin:/opt/local/sbin:$HOME/bin:$HOME/.local/bin:$HOME/scripts:$PM_BIN:$HOME/.dotnet/tools:/usr/local/go/bin:$HOME/go/bin:$PATH

# Java & Android
export JAVA_HOME=/Library/Java/JavaVirtualMachines/zulu-17.jdk/Contents/Home
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools

# Flutter
export PATH=$HOME/dev/.tools/flutter/bin:$PATH

# Gems
export PATH=$HOME/.gem/bin:$PATH

# Flags
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:~/.mujoco/mujoco210
export DYLD_LIBRARY_PATH=/opt/homebrew/lib/
export GRAPHVIZ_DIR=/opt/homebrew/opt/graphviz/
export PRETTIERD_DEFAULT_CONFIG=$HOME/.config/.prettierrc

# Python
export MAMBA_ROOT_PREFIX=$HOME

# Node.js
source $(brew --prefix nvm)/nvm.sh
export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

## Key bindings

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
   setxkbmap -option caps:none
   xmodmap .xmodmap
fi

## Aliases

# gcc (aghhhhhh)
# alias gcc='gcc-14'

# generic
alias mkd='mkdir -p'
alias playlol='defaults write .GlobalPreferences com.apple.mouse.scaling -1'
alias cl='clear'
alias upgrade='brew update && brew upgrade && brew upgrade --cask wez/wezterm/wezterm-nightly --no-quarantine --greedy-latest && brew cleanup'

# cd (zoxide)
alias cd='z'

# find (files), search (text) and view
alias f='fd -H'
alias s='rg --hidden'
alias ls='eza --long --no-user --header --icons --git --all --group-directories-first'
alias tree='eza --long --no-user --header --icons --git --all --group-directories-first --tree'

# tasks
alias tui='htop'  # ui
alias tm='mprocs' # manager

# git
alias g='git'
alias gui='lazygit' # ui
alias ga='git add --all'
alias gb='git branch'
alias gC='git clone'
alias gc='git commit -m'
alias gd='git diff'
alias gm='git merge'
alias gk='git checkout'
alias gK='git checkout -b'
alias gp='git pull'
alias gP='git push'
alias gr='git rebase'
alias gR='git reset'
alias gS='git stash'
alias gs='git status'

# docker
alias dui='lazydocker' # ui

# kubernetes
alias kui='k9s' # ui

# nvim
alias v='nvim'
alias vd='nvim -d'
alias vv='neovide --no-tabs --title-hidden' # vv(isual)
alias vui='neovide --no-tabs --title-hidden' # v(ui)

# helix
alias h='hx'

# zellij
alias zj='zellij a' # attach to last session

# tmux
alias t='tmux'
alias tn='tmux new -s'
alias ta='tmux attach -t'
alias td='tmux detach'
alias tls='tmux ls'
alias ts='tmux kill-server'
alias tk='tmux kill-session -t'

# python
alias p='ipython'
alias pyenv='python3 -m venv venv'
alias pyact='source ./venv/bin/activate'

# pip
alias pi='python -m pip install' # install package
alias pr='python -m pip uninstall' # remove package
alias pu='python -m pip install --upgrade' # upgrade package
alias pU='python -m pip install --upgrade pip' # upgrade pip
alias pir='python -m pip install -r' # install requirements
alias pmr='python -m pip freeze > requirements.txt' # make requirements
alias pc='python -m pip cache purge' # clear cache
alias pub='python -m build && python -m twine upload dist/*' # publish package

# mamba
alias mu='micromamba update'
alias mU='micromamba update'
alias mle='micromamba env list'
alias mee='micromamba env export >>' # export
alias mie='micromamba env create -f' # import
alias ma='micromamba activate'
alias md='micromamba activate base'
alias mi='micromamba install'
alias mir='micromamba install --file' # install requirements
alias mr='micromamba remove'
alias mmr='micromamba list -e > requirements.txt'
alias ml='micromamba list'
alias mc='micromamba clean --all'
# alias mr='conda rename -n' # TODO: how can we do this with micromamba?
alias ms='micromamba search'

mn() # mamba new
{
    micromamba create -n "$1" python=3.11 &&
    micromamba activate "$1" &&
}

mN() # mamba new empty
{
    micromamba create -n "$1" &&
    micromamba activate "$1" &&
}

mre() # mamba remove environment
{
    micromamba env remove -n "$1" &&
    micromamba clean --all &&
    jupyter kernelspec remove "$1"
}

# jupyter
alias jn='jupyter notebook'

jr() # jupyter register environment
{
    python -m pip install ipykernel &&
    python -m ipykernel install --user --name="$1" --display-name="$1"
}

# wezterm
alias wrw='wezterm cli rename-workspace'

# document format conversions
md2pdf()
{
    pandoc "$1" --pdf-engine=xelatex --variable "geometry=margin=1.2in" --data-dir=~/.config/pandoc -o "$2"
}

# Codi
# Usage: codi [filetype] [filename]
# codi() {
#   local syntax="${1:-python}"
#   shift
#   nvim -c \
#     "let g:startify_disable_at_vimenter = 1 |\
#     set bt=nofile ls=0 noru nonu nornu |\
#     hi ColorColumn ctermbg=NONE |\
#     hi VertSplit ctermbg=NONE |\
#     hi NonText ctermfg=0 |\
#     Codi $syntax" "$@"
# }

. "$HOME/.cargo/env"

##
# Your previous /Users/ser/.zprofile file was backed up as /Users/ser/.zprofile.macports-saved_2022-09-20_at_15:20:28
##

# Shell completions
# micromamba shell completion # FIX: not working

# Secret keys etc.
source $HOME/.secrets
