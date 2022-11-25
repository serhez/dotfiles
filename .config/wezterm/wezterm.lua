local wezterm = require("wezterm")

wezterm.on("toggle-ligature", function(window, pane)
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

return {
	-- General
	automatically_reload_config = true,
	scrollback_lines = 3500,
	window_padding = {
		left = "20pt",
		right = "20pt",
		top = "20pt",
		bottom = "20pt",
	},
	default_cursor_style = "BlinkingBar",
	-- FIX: This should make the title bar transparent while still showing the icons
	window_decorations = "RESIZE", -- TODO: Remove this when transparent title bar works
	-- window_frame = {
	--     inactive_titlebar_bg = "none",
	--     active_titlebar_bg = "none",
	-- },

	-- Font
	font = wezterm.font({
		family = "JetBrainsMono NF",
		weight = "Regular", -- "Medium" is also good, a bit thicker
	}),
	font_size = 16.0,

	-- Colors
	color_scheme = "tokyonight-dimmed",

	-- Tab bar
	use_fancy_tab_bar = false,
	hide_tab_bar_if_only_one_tab = true,
	colors = {
		tab_bar = {
			background = "#0b0022",

			active_tab = {
				bg_color = "#ffffff",
				fg_color = "#c0c0c0",
				intensity = "Normal",
				underline = "None",
				italic = false,
				strikethrough = true,
			},

			inactive_tab = {
				bg_color = "#1b1032",
				fg_color = "#808080",
			},

			inactive_tab_hover = {
				bg_color = "#3b3052",
				fg_color = "#909090",
				italic = true,
			},

			new_tab = {
				bg_color = "#1b1032",
				fg_color = "#808080",
			},

			new_tab_hover = {
				bg_color = "#3b3052",
				fg_color = "#909090",
				italic = true,
			},
		},
	},

	-- Key mappings
	keys = {
		{
			key = "L",
			mods = "CTRL",
			action = wezterm.action.EmitEvent("toggle-ligature"),
		},
	},
}
