#!/bin/bash
# Copyright (C) Sergio Hernandez - All Rights Reserved
# Author: Sergio Hernandez <contact.sergiohernandez@gmail.com>
# Date  : 25.08.2020
#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# export PS1="\[\033[38;2;229;192;123m\]\w\[$(tput sgr0)\] \[$(tput sgr0)\]\[$(tput bold)\]\[\033[38;2;224;108;117m\]>\[$(tput sgr0)\] \[$(tput sgr0)\]"
# export PS1="\[\033[38;2;86;182;194m\]\w\[$(tput sgr0)\] \[$(tput sgr0)\]\[$(tput bold)\]\[\033[38;2;224;108;117m\]>\[$(tput sgr0)\] \[$(tput sgr0)\]"
# export PS1="\[\033[38;2;229;192;123m\]\w\[$(tput sgr0)\] \[$(tput sgr0)\]\[$(tput bold)\]\[\033[38;2;86;182;194m\]>\[$(tput sgr0)\] \[$(tput sgr0)\]"
export PS1="\[\033[38;2;229;192;123m\]\w\[$(tput sgr0)\] \[$(tput sgr0)\]\[$(tput bold)\]\[\033[38;2;198;120;221m\]>\[$(tput sgr0)\] \[$(tput sgr0)\]"

. "$HOME/.cargo/env"
