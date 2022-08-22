local wezterm = require("wezterm")

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
    -- FIX: This should make the title bar transparent while still showing the icons
    window_decorations = "RESIZE", -- TODO: Remove this when transparent title bar works
    -- window_frame = {
    --     inactive_titlebar_bg = "#ffffff",
    --     active_titlebar_bg = "#ffffff",
    -- },

    -- Font
    font = wezterm.font({
        family = "JetBrainsMono NF",
        weight = "Regular", -- "Medium" is also good, a bit thicker
    }),
    font_size = 16.0,

    -- Colors
    color_scheme = "tokyonight-dark",

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
}
