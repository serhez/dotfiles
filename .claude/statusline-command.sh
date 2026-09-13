#!/usr/bin/env bash

input=$(cat)

# --- Extract fields from JSON ---
cwd=$(echo "$input" | jq -r '.cwd // empty')
model=$(echo "$input" | jq -r '.model.display_name // empty')
remaining=$(echo "$input" | jq -r '.context_window.remaining_percentage // empty')

# --- Colors (ANSI truecolor) ---
white='\033[38;2;180;180;180m'
reset='\033[0m'

output=""

# 1. Model name + effort level
if [ -n "$model" ]; then
    effort=$(jq -r '.effortLevel // empty' ~/.claude/settings.json 2>/dev/null)
    if [ -n "$effort" ]; then
        effort_upper=$(echo "$effort" | tr '[:lower:]' '[:upper:]')
        output="${output}$(printf "󰧑 %s [%s]${reset}" "$model" "$effort_upper")"
    else
        output="${output}$(printf "󰧑 %s${reset}" "$model")"
    fi
fi

# 2. Context window remaining
if [ -n "$remaining" ]; then
    pct=$(printf "%.0f" "$remaining")
    output="${output}$(printf " ·  %.0f%% free${reset}" "$pct")\n"
fi

# Newline
output="${output}\n"

# 3. CWD
if [ -n "$cwd" ]; then
    # Abbreviate $HOME to ~
    display_cwd="${cwd/#$HOME/\~}"
    output="${output}$(printf " %s${reset}" "$display_cwd")"
fi

# 4. Git branch
if [ -n "$cwd" ]; then
    branch=$(git -C "$cwd" branch --show-current 2>/dev/null)
    if [ -n "$branch" ]; then
        output="${output}$(printf " ·  %s${reset}" "$branch")"
    fi
fi

# 5. Python/conda virtualenv
venv=""
if [ -n "${VIRTUAL_ENV:-}" ]; then
    venv=$(basename "$VIRTUAL_ENV")
elif [ -n "${CONDA_DEFAULT_ENV:-}" ] && [ "$CONDA_DEFAULT_ENV" != "base" ]; then
    venv="$CONDA_DEFAULT_ENV"
fi
if [ -n "$venv" ]; then
    output="${output}$(printf " · 󰆧 %s${reset}" "$venv")"
fi

printf "%b" "$output"
