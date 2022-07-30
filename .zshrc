# Path to your oh-my-zsh installation.
export ZSH="$HOME/.config/.oh-my-zsh"

DEFAULT_USER="whoami"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
HIST_STAMPS="mm/dd/yyyy"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# Source my profile after oh-my-zsh, else it will override my custom aliases etc.
source $HOME/.zprofile

source $PM_SHARE/zsh-autosuggestions/zsh-autosuggestions.zsh
source $PM_SHARE/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $PM_SHARE/zsh-vi-mode/zsh-vi-mode.plugin.zsh

eval "$(starship init zsh)"
