# Path to your oh-my-zsh installation.
export ZSH="$HOME/.config/.oh-my-zsh"

if [[ -n "${__SER_ZSHRC_LOADED:-}" && "${(t)__SER_ZSHRC_LOADED}" != *export* ]]; then
  [[ -r "$HOME/.ssh/agent/env" ]] && source "$HOME/.ssh/agent/env" >/dev/null
  [[ -r "$HOME/.zsh_aliases" ]] && source "$HOME/.zsh_aliases"
  return
fi
typeset -g __SER_ZSHRC_LOADED=1
typeset +x __SER_ZSHRC_LOADED

if [[ -z "${__SER_ZPROFILE_LOADED:-}" && -r "$HOME/.zprofile" ]]; then
  source "$HOME/.zprofile"
fi

DEFAULT_USER="whoami"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="false"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
HIST_STAMPS="dd/mm/yyyy"

# History
HISTSIZE=10000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# Key bindings
bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
zstyle ':omz:plugins:nvm' lazy yes
# Keep ssh-agent out of the plugin list so keys are requested only on actual SSH use.
plugins=(dotenv command-not-found gitfast gh ssh docker docker-compose kubectl pip npm nvm)

source $ZSH/oh-my-zsh.sh

_ser_setup_ssh_agent() {
  [[ "$OSTYPE" == darwin* ]] || return 0

  local agent_dir="$HOME/.ssh/agent"
  local agent_env="$agent_dir/env"
  local agent_sock="$agent_dir/agent.sock"
  local keychain_loaded="$agent_dir/keychain-loaded"
  local agent_status started=0

  mkdir -p "$agent_dir"
  chmod 700 "$agent_dir"

  _ser_ssh_agent_status() {
    [[ -n "${SSH_AUTH_SOCK:-}" && -S "$SSH_AUTH_SOCK" ]] || return 2
    ssh-add -l >/dev/null 2>&1
    agent_status=$?
    [[ "$agent_status" -eq 0 || "$agent_status" -eq 1 ]] && return "$agent_status"
    return 2
  }

  _ser_ssh_agent_status
  agent_status=$?

  if [[ "$agent_status" -eq 2 && -r "$agent_env" ]]; then
    source "$agent_env" >/dev/null
    _ser_ssh_agent_status
    agent_status=$?
  fi

  if [[ "$agent_status" -eq 2 ]]; then
    rm -f "$agent_sock"
    rm -f "$keychain_loaded"
    eval "$(ssh-agent -s -a "$agent_sock")" >/dev/null
    started=1
    {
      printf 'export SSH_AUTH_SOCK=%q\n' "$SSH_AUTH_SOCK"
      printf 'export SSH_AGENT_PID=%q\n' "$SSH_AGENT_PID"
    } >| "$agent_env"
    chmod 600 "$agent_env"
    _ser_ssh_agent_status
    agent_status=$?
  fi

  if [[ ("$started" -eq 1 || "$agent_status" -eq 1) && ! -e "$keychain_loaded" ]]; then
    ssh-add --apple-load-keychain -q >/dev/null 2>&1 || true
    : >| "$keychain_loaded"
    chmod 600 "$keychain_loaded"
  fi

  launchctl setenv SSH_AUTH_SOCK "$SSH_AUTH_SOCK" >/dev/null 2>&1 || true
  unfunction _ser_ssh_agent_status
}
_ser_setup_ssh_agent
unfunction _ser_setup_ssh_agent

if [[ -r "$HOME/.zsh_aliases" ]]; then
  source "$HOME/.zsh_aliases"
fi

if [[ -f "/opt/homebrew/bin/brew" ]] then
  # If you're using macOS, you'll want this enabled
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Set the directory we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi
# Source/Load zinit
source "${ZINIT_HOME}/zinit.zsh"

# Add in zsh plugins
zinit ice depth=1
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light jeffreytse/zsh-vi-mode
zinit light Aloxaf/fzf-tab

# Add in snippets
# zinit snippet OMZL::git.zsh
# zinit snippet OMZP::sudo
# zinit snippet OMZP::archlinux
# zinit snippet OMZP::aws
# zinit snippet OMZP::kubectl
# zinit snippet OMZP::kubectx
# zinit snippet OMZP::command-not-found

# Docker Desktop completions
ZSH_COMPLETION_CACHE="${XDG_CACHE_HOME:-$HOME/.cache}/zsh/completions"
mkdir -p "$ZSH_COMPLETION_CACHE"
fpath=("$ZSH_COMPLETION_CACHE" /Users/ser/.docker/completions $fpath)

_zsh_cache_completion() {
  local name="$1"
  shift
  local command_name="$1"
  local completion_file="$ZSH_COMPLETION_CACHE/_$name"

  (( $+commands[$command_name] )) || return 0
  if [[ ! -s "$completion_file" || "$commands[$command_name]" -nt "$completion_file" ]]; then
    "$@" >| "$completion_file" 2>/dev/null
  fi
}

_zsh_cache_completion pixi pixi completion --shell zsh
_zsh_cache_completion uv uv generate-shell-completion zsh
_zsh_cache_completion uvx uvx --generate-shell-completion zsh
unfunction _zsh_cache_completion

# Load completions
autoload -Uz compinit && compinit

zinit cdreplay -q

eval "$(starship init zsh)"
eval "$(zoxide init zsh)"
eval "$(fzf --zsh)"

export _ZO_DOCTOR=0  # no annoying notifications

if command -v marimo 2>&1 >/dev/null
then
    eval "$(_MARIMO_COMPLETE=zsh_source marimo)"
fi

# >>> mamba initialize >>>
# !! Contents within this block are managed by 'mamba init' !!
export MAMBA_EXE='/opt/homebrew/bin/micromamba';
export MAMBA_ROOT_PREFIX='/Users/ser/micromamba';
__mamba_setup="$("$MAMBA_EXE" shell hook --shell zsh --root-prefix "$MAMBA_ROOT_PREFIX" 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__mamba_setup"
else
    alias micromamba="$MAMBA_EXE"  # Fallback on help from mamba activate
fi
unset __mamba_setup
# <<< mamba initialize <<<

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
. "/Users/ser/.deno/env"

# Change tmux window name on directory change
export TMUX_PLUGIN_MANAGER_PATH="$HOME/.config/tmux/plugins/"

### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

### End of Zinit's installer chunk

# Added by Antigravity
export PATH="/Users/ser/.antigravity/antigravity/bin:$PATH"
