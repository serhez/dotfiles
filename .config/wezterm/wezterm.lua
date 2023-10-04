local wezterm = require("wezterm")

local font = wezterm.font({
	family = "JetBrainsMono Nerd Font Mono",
	weight = "Regular", -- "Medium" is also good, a bit thicker
})

local function is_vi_process(pane)
	return pane:get_foreground_process_name():find("n?vim") ~= nil
end

local function conditional_activate_pane(window, pane, pane_direction, vim_direction)
	if is_vi_process(pane) then
		window:perform_action(wezterm.action.SendKey({ key = vim_direction, mods = "CTRL" }), pane)
	else
		window:perform_action(wezterm.action.ActivatePaneDirection(pane_direction), pane)
	end
end

wezterm.on("ActivatePaneDirection-right", function(window, pane)
	conditional_activate_pane(window, pane, "Right", "l")
end)
wezterm.on("ActivatePaneDirection-left", function(window, pane)
	conditional_activate_pane(window, pane, "Left", "h")
end)
wezterm.on("ActivatePaneDirection-up", function(window, pane)
	conditional_activate_pane(window, pane, "Up", "k")
end)
wezterm.on("ActivatePaneDirection-down", function(window, pane)
	conditional_activate_pane(window, pane, "Down", "j")
end)

wezterm.on("toggle-ligature", function(window, _)
	local overrides = window:get_config_overrides() or {}
	if not overrides.harfbuzz_features then
		-- If we haven't overridden it yet, then override with ligatures disabled
		overrides.harfbuzz_features = { "calt=0", "clig=0", "liga=0" }
	else
		-- else we did already, and we should disable out override now
		overrides.harfbuzz_features = nil
	end
	window:set_config_overrides(overrides)
end)

local icon_colors = {
	rosewater = "#F5E0DC",
	flamingo = "#F2CDCD",
	pink = "#F5C2E7",
	mauve = "#CBA6F7",
	red = "#F38BA8",
	maroon = "#EBA0AC",
	peach = "#DFA44B",
	yellow = "#F9E2AF",
	green = "#669149",
	teal = "#94E2D5",
	sky = "#89DCEB",
	sapphire = "#74C7EC",
	blue = "#89B4FA",
	lavender = "#B4BEFE",

	text = "#CDD6F4",
	subtext1 = "#BAC2DE",
	subtext0 = "#A6ADC8",
	overlay2 = "#9399B2",
	overlay1 = "#7F849C",
	overlay0 = "#6C7086",
	surface2 = "#585B70",
	surface1 = "#45475A",
	surface0 = "#313244",

	base = "#1E1E2E",
	mantle = "#181825",
	crust = "#11111B",
}

local function get_process(tab)
	local process_icons = {
		["docker"] = {
			{ Foreground = { Color = icon_colors.blue } },
			{ Text = wezterm.nerdfonts.linux_docker },
		},
		["docker-compose"] = {
			{ Foreground = { Color = icon_colors.blue } },
			{ Text = wezterm.nerdfonts.linux_docker },
		},
		["nvim"] = {
			{ Foreground = { Color = icon_colors.green } },
			{ Text = wezterm.nerdfonts.custom_vim },
		},
		["vim"] = {
			{ Foreground = { Color = icon_colors.green } },
			{ Text = wezterm.nerdfonts.dev_vim },
		},
		["node"] = {
			{ Foreground = { Color = icon_colors.green } },
			{ Text = wezterm.nerdfonts.mdi_hexagon },
		},
		["zsh"] = {
			{ Foreground = { Color = icon_colors.peach } },
			{ Text = wezterm.nerdfonts.dev_terminal },
		},
		["bash"] = {
			{ Foreground = { Color = icon_colors.subtext0 } },
			{ Text = wezterm.nerdfonts.cod_terminal_bash },
		},
		["paru"] = {
			{ Foreground = { Color = icon_colors.lavender } },
			{ Text = wezterm.nerdfonts.linux_archlinux },
		},
		["htop"] = {
			{ Foreground = { Color = icon_colors.yellow } },
			{ Text = wezterm.nerdfonts.mdi_chart_donut_variant },
		},
		["cargo"] = {
			{ Foreground = { Color = icon_colors.peach } },
			{ Text = wezterm.nerdfonts.dev_rust },
		},
		["go"] = {
			{ Foreground = { Color = icon_colors.sapphire } },
			{ Text = wezterm.nerdfonts.mdi_language_go },
		},
		["lazydocker"] = {
			{ Foreground = { Color = icon_colors.blue } },
			{ Text = wezterm.nerdfonts.linux_docker },
		},
		["git"] = {
			{ Foreground = { Color = icon_colors.peach } },
			{ Text = wezterm.nerdfonts.dev_git },
		},
		["lazygit"] = {
			{ Foreground = { Color = icon_colors.peach } },
			{ Text = wezterm.nerdfonts.dev_git },
		},
		["lua"] = {
			{ Foreground = { Color = icon_colors.blue } },
			{ Text = wezterm.nerdfonts.seti_lua },
		},
		["wget"] = {
			{ Foreground = { Color = icon_colors.yellow } },
			{ Text = wezterm.nerdfonts.mdi_arrow_down_box },
		},
		["curl"] = {
			{ Foreground = { Color = icon_colors.yellow } },
			{ Text = wezterm.nerdfonts.mdi_flattr },
		},
		["gh"] = {
			{ Foreground = { Color = icon_colors.mauve } },
			{ Text = wezterm.nerdfonts.dev_github_badge },
		},
		["ruby"] = {
			{ Foreground = { Color = icon_colors.mauve } },
			{ Text = wezterm.nerdfonts.dev_ruby },
		},
		["ssh"] = {
			{ Foreground = { Color = icon_colors.blue } },
			{ Text = wezterm.nerdfonts.md_ssh },
		},
		["python"] = {
			{ Foreground = { Color = icon_colors.peach } },
			{ Text = wezterm.nerdfonts.dev_python },
		},
		["python3.9"] = {
			{ Foreground = { Color = icon_colors.peach } },
			{ Text = wezterm.nerdfonts.dev_python },
		},
		["python3.10"] = {
			{ Foreground = { Color = icon_colors.peach } },
			{ Text = wezterm.nerdfonts.dev_python },
		},
		["python3.11"] = {
			{ Foreground = { Color = icon_colors.peach } },
			{ Text = wezterm.nerdfonts.dev_python },
		},
		["python3.12"] = {
			{ Foreground = { Color = icon_colors.peach } },
			{ Text = wezterm.nerdfonts.dev_python },
		},
		["sftp"] = {
			{ Foreground = { Color = icon_colors.blue } },
			{ Text = wezterm.nerdfonts.md_download },
		},
		["ftp"] = {
			{ Foreground = { Color = icon_colors.blue } },
			{ Text = wezterm.nerdfonts.md_download },
		},
	}

	local process_name = string.gsub(tab.active_pane.foreground_process_name, "(.*[/\\])(.*)", "%2")

	return wezterm.format(
		process_icons[process_name]
			or { { Foreground = { Color = icon_colors.text } }, { Text = string.format("[%s]", process_name) } }
	)
end

local function get_cwd(tab)
	local current_dir = tab.active_pane.current_working_dir.file_path
	local HOME_DIR = string.format("file://%s", os.getenv("HOME"))

	return current_dir == HOME_DIR and "~" or string.format("%s", string.gsub(current_dir, "(.*[/\\])(.*)", "%2"))
end

wezterm.on("format-tab-title", function(tab)
	return {
		{ Text = "  " .. get_process(tab) .. " " .. get_cwd(tab) .. "  " },
	}
end)

wezterm.on("update-right-status", function(window)
	window:set_right_status(wezterm.format({
		{ Foreground = { Color = icon_colors.mauve } },
		{ Text = wezterm.strftime("  ") },
		{ Foreground = { Color = icon_colors.text } },
		{ Text = wezterm.strftime("%a %d %b") },
		{ Foreground = { Color = icon_colors.blue } },
		{ Text = wezterm.strftime("  󰥔 ") },
		{ Foreground = { Color = icon_colors.text } },
		{ Text = wezterm.strftime("%H:%M ") },
	}))
end)

return {
	-- General
	automatically_reload_config = true,
	scrollback_lines = 3500,
	max_fps = 120,
	enable_wayland = false,
	pane_focus_follows_mouse = false,
	warn_about_missing_glyphs = false,
	show_update_window = false,
	check_for_updates = false,
	line_height = 1.0,
	disable_default_key_bindings = true,
	front_end = "WebGpu",
	window_padding = {
		left = "20pt",
		right = "20pt",
		top = "10pt",
		bottom = "10pt",
	},
	default_cursor_style = "BlinkingBar",
	enable_scroll_bar = false,

	-- Titlebar
	window_decorations = "INTEGRATED_BUTTONS|RESIZE",
	switch_to_last_active_tab_when_closing_tab = true,
	tab_max_width = 50,
	hide_tab_bar_if_only_one_tab = false,
	tab_bar_at_bottom = false,
	use_fancy_tab_bar = false,
	show_new_tab_button_in_tab_bar = true,
	show_tab_index_in_tab_bar = false,
	window_frame = {
		font = font,
		font_size = 13.0,
	},

	-- Font
	font = font,
	font_size = 16.0,
	command_palette_font_size = 16.0,

	inactive_pane_hsb = {
		hue = 1.0,
		saturation = 1.0,
		brightness = 0.7,
	},
	window_background_opacity = 1.0,
	window_close_confirmation = "AlwaysPrompt",

	color_scheme = "catppuccin-dimmed",
	force_reverse_video_cursor = true,

	keys = {
		{ key = "q", mods = "CMD", action = wezterm.action.QuitApplication },
		{ key = "k", mods = "CMD", action = wezterm.action.CloseCurrentPane({ confirm = true }) },
		{ key = "k", mods = "CMD|SHIFT", action = wezterm.action.CloseCurrentTab({ confirm = true }) },

		{ key = "w", mods = "CMD", action = wezterm.action.SpawnWindow },
		{ key = "t", mods = "CMD", action = wezterm.action({ SpawnTab = "CurrentPaneDomain" }) },
		{ key = "z", mods = "CMD", action = wezterm.action.TogglePaneZoomState },
		{ key = "f", mods = "CMD|SHIFT", action = wezterm.action.ToggleFullScreen },

		{ key = "/", mods = "CMD", action = wezterm.action({ SplitHorizontal = { domain = "CurrentPaneDomain" } }) },
		{
			key = "-",
			mods = "CMD|SHIFT",
			action = wezterm.action({ SplitVertical = { domain = "CurrentPaneDomain" } }),
		},

		{ key = "m", mods = "CMD", action = wezterm.action.ActivateCommandPalette },
		{
			key = "n",
			mods = "CMD",
			action = wezterm.action.ShowLauncherArgs({ title = "Tabs", flags = "FUZZY|TABS" }),
		},
		{
			key = "n",
			mods = "CMD|SHIFT",
			action = wezterm.action.ShowLauncherArgs({ title = "Workspaces", flags = "FUZZY|WORKSPACES" }),
		},
		{ key = "s", mods = "CMD", action = wezterm.action.PaneSelect },
		{ key = "s", mods = "CMD|SHIFT", action = wezterm.action.PaneSelect({ mode = "SwapWithActive" }) },

		{ key = "c", mods = "CMD", action = wezterm.action({ CopyTo = "Clipboard" }) },
		{ key = "v", mods = "CMD", action = wezterm.action({ PasteFrom = "Clipboard" }) },
		{ key = "v", mods = "CMD|SHIFT", action = wezterm.action.ActivateCopyMode },
		{ key = "f", mods = "CMD", action = wezterm.action.Search("CurrentSelectionOrEmptyString") },

		{ key = "h", mods = "CTRL", action = wezterm.action.EmitEvent("ActivatePaneDirection-left") },
		{ key = "j", mods = "CTRL", action = wezterm.action.EmitEvent("ActivatePaneDirection-down") },
		{ key = "k", mods = "CTRL", action = wezterm.action.EmitEvent("ActivatePaneDirection-up") },
		{ key = "l", mods = "CTRL", action = wezterm.action.EmitEvent("ActivatePaneDirection-right") },
		{ key = "h", mods = "CTRL|CMD", action = wezterm.action.AdjustPaneSize({ "Left", 1 }) },
		{ key = "j", mods = "CTRL|CMD", action = wezterm.action.AdjustPaneSize({ "Down", 1 }) },
		{ key = "k", mods = "CTRL|CMD", action = wezterm.action.AdjustPaneSize({ "Up", 1 }) },
		{ key = "l", mods = "CTRL|CMD", action = wezterm.action.AdjustPaneSize({ "Right", 1 }) },
		{ key = "[", mods = "CMD", action = wezterm.action({ ActivateTabRelative = -1 }) },
		{ key = "]", mods = "CMD", action = wezterm.action({ ActivateTabRelative = 1 }) },
		{ key = "[", mods = "CMD|SHIFT", action = wezterm.action.MoveTabRelative(-1) },
		{ key = "]", mods = "CMD|SHIFT", action = wezterm.action.MoveTabRelative(1) },

		{ key = "=", mods = "CMD", action = wezterm.action.IncreaseFontSize },
		{ key = "-", mods = "CMD", action = wezterm.action.DecreaseFontSize },

		{ mods = "ALT", key = "L", action = wezterm.action.EmitEvent("toggle-ligature") },
	},

	hyperlink_rules = {
		{
			regex = "\\b\\w+://[\\w.-]+:[0-9]{2,15}\\S*\\b",
			format = "$0",
		},
		{
			regex = "\\b\\w+://[\\w.-]+\\.[a-z]{2,15}\\S*\\b",
			format = "$0",
		},
		{
			regex = [[\b\w+@[\w-]+(\.[\w-]+)+\b]],
			format = "mailto:$0",
		},
		{
			regex = [[\bfile://\S*\b]],
			format = "$0",
		},
		{
			regex = [[\b\w+://(?:[\d]{1,3}\.){3}[\d]{1,3}\S*\b]],
			format = "$0",
		},
		{
			regex = [[\b[tT](\d+)\b]],
			format = "https://example.com/tasks/?t=$1",
		},
	},
}
