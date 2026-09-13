## Exports

export __SER_ZPROFILE_LOADED=1

# Linux
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    export PM_SHARE=/usr/share
    export PM_BIN=/usr/bin

    # Derive JAVA_HOME from the system java, if any (survives package updates)
    if command -v java >/dev/null; then
        export JAVA_HOME="$(dirname "$(dirname "$(readlink -f "$(command -v java)")")")"
    fi

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
            export JAVA_HOME="$(/usr/libexec/java_home -v 17)"
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
            export JAVA_HOME="$(/usr/libexec/java_home -v 17)"
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
export PATH=/opt/homebrew/opt/ruby/bin:/opt/homebrew/lib/ruby/gems/3.3.0/bin:/Users/ser/.gem/ruby/3.3.0/bin:/opt/homebrew/bin:/opt/homebrew/opt/llvm/bin:/opt/local/bin:/opt/local/sbin:$HOME/bin:$HOME/.local/bin:$HOME/scripts:$PM_BIN:$HOME/.dotnet/tools:/usr/local/go/bin:$HOME/go/bin:$PATH:/usr/local/bin:/usr/bin:/bin

# Java & Android
[[ -n "$JAVA_HOME" ]] && export PATH="$JAVA_HOME/bin:$PATH"
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
export PIXI_HOME=$HOME/.config/pixi

# Node.js
export NVM_DIR="$HOME/.nvm"
export NVM_HOMEBREW="/opt/homebrew/opt/nvm"

## Key bindings

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
   setxkbmap -option caps:none
   xmodmap .xmodmap
fi

# Interactive aliases and functions are loaded from ~/.zsh_aliases by ~/.zshrc.

. "$HOME/.cargo/env"

##
# Your previous /Users/ser/.zprofile file was backed up as /Users/ser/.zprofile.macports-saved_2022-09-20_at_15:20:28
##

# Shell completions
# micromamba shell completion # FIX: not working

# Secret keys etc.
source $HOME/.secrets

export PATH="$HOME/.elan/bin:$PATH"
