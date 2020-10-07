#!/bin/bash
# Copyright (C) Sergio Hernandez - All Rights Reserved
# Author: Sergio Hernandez <contact.sergiohernandez@gmail.com>
# Date  : 24.08.2020
export TERMINAL=alacritty
export EDITOR=nvim
export VISUAL=nvim
export PAGER=nvim
export HOME=/home/ser
export BAT_THEME="TwoDark"
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:$HOME/bin:$HOME/.local/bin:$HOME/.dotnet/tools

# Key bindings
setxkbmap -option caps:none
xmodmap .xmodmap

