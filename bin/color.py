#!/usr/bin/env python

import sys
import fileinput

HOME = "/home/ser/"
color = sys.argv[1]

def replaceAll(file, search, replace):
    for line in fileinput.input(file, inplace=1):
        if search in line:
            line = replace + '\n'
        sys.stdout.write(line)

tmux_plugin = {
        "nord": "arcticicestudio/nord-tmux",
        "onedark": "odedlaz/tmux-onedark-theme",
        "solarized": "seebi/tmux-colors-solarized",
        "dracula": "dracula/tmux"
        }

# VIM
replaceAll(HOME + ".config/nvim/color.vim", "colorscheme", "colorscheme " + color)
replaceAll(HOME + ".config/nvim/plug-config/lightline.vim", "colorscheme", 
        "let g:lightline.colorscheme = '" + color + "'")

# Alacritty
replaceAll(HOME + ".config/alacritty/alacritty.yml", "colors: *", "colors: *" + color)

# TMUX - ALSO NEEDS CTRL+a+I
replaceAll(HOME + ".tmux.conf", "colorscheme", "set -g @plugin '" + tmux_plugin[color] 
        + "' # DO NOT REMOVE THIS COMMENT - colorscheme")

# .Xresources
replaceAll(HOME + ".Xresources", "colorscheme", '#include ".Xresources.d/colorscheme/' + color
        + '"')

# Ranger
replaceAll(HOME + ".config/ranger/scope.sh", "HIGHLIGHT_STYLE",
        "HIGHLIGHT_STYLE=${HIGHLIGHT_STYLE:-base16/" + color + "}")

# TODO: bashrc
# TODO: BAT_THEME in .profile
# TODO: AwesomeWM
# TODO: Rofi

