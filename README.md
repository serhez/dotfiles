# Dotfiles

- OS kernel: **Linux** / **MacOS**
- Distro (Linux): **arch**
- Window manager (Linux): **awesome-wm**
- Window switcher & launcher (Linux): **rofi**
- Shell: **zsh** with **oh-my-zsh**
- Terminal: **wezterm**
- Terminal multiplexers: **Herdr** and **tmux**
- JavaScript runtimes: **Bun** and **Node.js**
- Editor / IDE: **neovim**

## Installer

Use `make install` to install all dependencies and configure the environment.

The installer supports Arch Linux and MacOS.

Note that I have not tested the installer too much so it may not work; I don't really care as what really matters to me is that all steps and dependencies of my working environment are recorded somewhere.

## Forking

I have created a script you can use via `make fetch-local` where any changes made to your dotfiles in your system are brought into the repo. In this way, if you are forking this repo and updating it with your own config, you can do this without having to copy-paste every file individually.

## Neovim

I use Neovim as a text editor. I have a [Neovim config](https://github.com/serhez/nvim-conf) which you can also optionally install through the installer (it will ask you).

## AI coding agents

The fetch and install scripts track:

- Shared global instructions in `~/.codex/AGENTS.md`, linked from Claude Code and OpenCode's instruction paths.
- Claude Code's settings and status-line script from `~/.claude/`.
- Codex's configuration from `~/.codex/config.toml`, excluding ChatGPT-app
  runtime paths, bundled local marketplace paths, and hook trust cache.
- OpenCode's main configuration at `~/.config/opencode/opencode.jsonc`.
- Herdr's official global skill for Claude Code and Codex.

## Herdr

The fetch and install scripts track Herdr's main configuration and user-edited
plugin settings. The installer also installs the plugins referenced by that
configuration and regenerates Herdr's managed Claude, Codex, and OpenCode
integrations. It also installs Herdr's official shared agent skill for Claude
Code and Codex. Runtime state, logs, session data, generated integration hooks,
plugin registries, downloaded plugin sources, and skill caches are not tracked.
