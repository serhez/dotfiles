#!/usr/bin/env python

import sys
import fileinput

HOME = "$HOME"

SUPPORTED = {
        "dracula",
        "nightowl",
        "nord",
        "onedark",
        "solarized",
        "gotham",
        "ayu",
        "gruvbox",
        "palenight"
        }

SUPPORTED_PRINT = [
        "dracula",
        "nightowl",
        "nord",
        "onedark",
        "solarized -[l,d]",
        "gotham",
        "ayu -[l,d,m]",
        "gruvbox -[l,d]",
        "palenight"
        ]

VARIANT = {
        "l": "light",
        "d": "dark",
        "m": "mirage"
        }

TMUX_PLUGIN = {
        "nord": "arcticicestudio/nord-tmux",
        "nightowl": "jsec/tmux-night-owl",
        "onedark": "odedlaz/tmux-onedark-theme",
        "solarized": "seebi/tmux-colors-solarized",
        "dracula": "dracula/tmux",
        "gotham": "shaneog/tmux-colors-gotham",
        "ayu": "jibingeo/tmux-colors-ayu",
        "gruvbox": "egel/tmux-gruvbox",
        "palenight": "tonylambiris/palenight-tmux"
        }

VIM_COLOR = {
        "nord": "nord",
        "nightowl": "night-owl",
        "onedark": "onedark",
        "solarized": "solarized8",
        "dracula": "dracula",
        "gotham": "gotham",
        "ayu": "ayu",
        "gruvbox": "gruvbox",
        "palenight": "palenight"
        }

LIGHTLINE_COLOR = {
        "nord": "nord",
        "nightowl": "nightowl",
        "onedark": "onedark",
        "solarized": "solarized",
        "dracula": "dracula",
        "gotham": "gotham",
        "ayu": "ayu",
        "gruvbox": "gruvbox",
        "palenight": "palenight"
        }

if len(sys.argv) < 2:
    print("\nYou need to specify a color or \"list\" to get a list of colors.\n")
    exit(1)

color = sys.argv[1]
if len(sys.argv) >= 3:
    variant = sys.argv[2][1:]
else:
    variant = None

if (color == "list"):
    print("\nThe list of available colorschemes is:")
    for s in SUPPORTED_PRINT:
        print("\t-", s)
    print()
    exit(0)

elif color not in SUPPORTED:
    print("\nERROR: The proposed color is not currently supported.")
    print()
    exit(1)

def replaceAll(file, search, replace):
    for line in fileinput.input(file, inplace=1):
        if search in line:
            line = replace + '\n'
        sys.stdout.write(line)

# VIM
replaceAll(HOME + ".config/nvim/color.vim", "colorscheme", "colorscheme " + VIM_COLOR[color])
replaceAll(HOME + ".config/nvim/plug-config/lightline.vim", "colorscheme", 
        "let g:lightline.colorscheme = '" + LIGHTLINE_COLOR[color] + "'")
if variant != None:
    if color == "ayu":
        if variant == "l":
            replaceAll(HOME + ".config/nvim/color.vim", "variant", "let ayucolor=\"light\"  \" variant (DO NOT DELETE THIS COMMENT)")
        elif variant == "d":
            replaceAll(HOME + ".config/nvim/color.vim", "variant", "let ayucolor=\"dark\"  \" variant (DO NOT DELETE THIS COMMENT)")
        elif variant == "m":
            replaceAll(HOME + ".config/nvim/color.vim", "variant", "let ayucolor=\"mirage\"  \" variant (DO NOT DELETE THIS COMMENT)")
    else:
        if variant == "l":
            replaceAll(HOME + ".config/nvim/color.vim", "variant", "set background=light  \" variant (DO NOT DELETE THIS COMMENT)")
        elif variant == "d":
            replaceAll(HOME + ".config/nvim/color.vim", "variant", "set background=dark  \" variant (DO NOT DELETE THIS COMMENT)")
else:
    # Assume dark
    replaceAll(HOME + ".config/nvim/color.vim", "variant", "set background=dark  \" variant (DO NOT DELETE THIS COMMENT)")

# Alacritty
if (variant != None):
    replaceAll(HOME + ".config/alacritty/alacritty.yml", "colors: *", "colors: *" + color + "-" +
            VARIANT[variant])
else:
    replaceAll(HOME + ".config/alacritty/alacritty.yml", "colors: *", "colors: *" + color)

# TMUX - ALSO NEEDS CTRL+a+I
replaceAll(HOME + ".tmux.conf", "colorscheme", "set -g @plugin '" + TMUX_PLUGIN[color] 
        + "' # DO NOT REMOVE THIS COMMENT - colorscheme")

# .Xresources
if (variant != None):
    replaceAll(HOME + ".Xresources", "colorscheme", '#include ".Xresources.d/colorscheme/' + color
            + '-' + VARIANT[variant] + '"')
else:
    replaceAll(HOME + ".Xresources", "colorscheme", '#include ".Xresources.d/colorscheme/' + color
            + '"')

# Ranger
replaceAll(HOME + ".config/ranger/scope.sh", "HIGHLIGHT_STYLE",
        "HIGHLIGHT_STYLE=${HIGHLIGHT_STYLE:-base16/" + color + "}")

# TODO: BAT_THEME in .profile
# TODO: AwesomeWM
# TODO: Rofi

