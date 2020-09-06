--[[--
Copyright (C) Sergio Hernandez - All Rights Reserved
Author: Sergio Hernandez <contact.sergiohernandez@gmail.com>
Date  : 25.08.2020
--]]--
local theme_assets = require("beautiful.theme_assets")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi
local cairo = require("lgi").cairo
local gears = require("gears")

local gfs = require("gears.filesystem")
local themes_path = gfs.get_configuration_dir().."themes/"

local theme = {}

--theme.font          = "Noto Sans 10"

theme.icons = themes_path.."default/icons/"

-- Color theme: https://github.com/joshdick/onedark.vim
local transparent    = "#00000000"
local bg             = "#282c34ff"
local bg_blurred     = "#282c34cc"
local focus          = "#49515fff"
local focus_blurred  = "#49515f88"
local accent         = "#56b6c2ff"
local accent_blurred = "#56b6c288"
local accent2        = "#80cbc4ff"
local urgent         = "#e06c75ff"
local volatile       = "#e5c07bff"
local white          = "#ffffffff"
local grey           = "#abb2bfff"
local green          = "#98c379ff"
local blue           = "#61afefff"

theme.bg_normal      = bg
theme.bg_focus       = focus_blurred
theme.bg_urgent      = urgent
theme.bg_minimize    = transparent
theme.bg_systray     = theme.bg_normal

theme.fg_normal      = white
theme.fg_focus       = white
theme.fg_urgent      = urgent
theme.fg_minimize    = transparent

theme.useless_gap    = dpi(5)
theme.border_width   = dpi(1)
theme.border_normal  = grey
theme.border_focus   = grey
theme.border_marked  = grey

-- There are other variable sets
-- overriding the default one when
-- defined, the sets are:
-- taglist_[bg|fg]_[focus|urgent|occupied|empty|volatile]
-- tasklist_[bg|fg]_[focus|urgent]
-- titlebar_[bg|fg]_[normal|focus]
-- tooltip_[font|opacity|fg_color|bg_color|border_width|border_color]
-- mouse_finder_[color|timeout|animate_timeout|radius|factor]
-- prompt_[fg|bg|fg_cursor|bg_cursor|font]
-- hotkeys_[bg|fg|border_width|border_color|shape|opacity|modifiers_fg|label_bg|label_fg|group_margin|font|description_font]

-- prompt_[fg|bg|fg_cursor|bg_cursor|font]
theme.prompt_font = "Noto Sans 9"
theme.prompt_bg = focus

-- taglist_[bg|fg]_[focus|urgent|occupied|empty|volatile]
theme.taglist_bg_empty = bg
theme.taglist_bg_occupied = bg
theme.taglist_bg_focus = focus
theme.taglist_bg_urgent = urgent
theme.taglist_bg_volatile = volatile
theme.taglist_fg_empty = grey
theme.taglist_fg_occupied = grey
theme.taglist_fg_focus = white
theme.taglist_fg_urgent = urgent
theme.taglist_fg_volatile = volatile
theme.taglist_squares_sel = nil
theme.taglist_squares_unsel = nil

-- theme.tasklist_[bg|fg]_[focus|urgent]
theme.tasklist_bg_focus = accent
theme.tasklist_bg_normal = focus
theme.tasklist_plain_task_name = true

-- titlebar_[bg|fg]_[normal|focus]
theme.titlebar_bg_normal = bg
theme.titlebar_bg_focus = bg

-- hotkeys_[bg|fg|border_width|border_color|shape|opacity|modifiers_fg|label_bg|label_fg|group_margi    n|font|description_font]
theme.hotkeys_modifiers_fg = grey
theme.hotkeys_font = "Noto Sans 10"
theme.hotkeys_description_font = "Noto Sans 8"
theme.hotkeys_opacity = 0.8

-- Variables set for theming notifications:
-- notification_font
-- notification_[bg|fg]
-- notification_[width|height|margin]
-- notification_[border_color|border_width|shape|opacity]
theme.notification_font = "Noto Sans 10"
theme.notification_margin = 100
theme.notification_border_color = focus_blurred
theme.notification_bg = focus_blurred
theme.notification_fg = white
theme.notification_opacity = 1

-- Variables set for theming the menu:
-- menu_[bg|fg]_[normal|focus]
-- menu_[border_color|border_width]

theme.menu_height = dpi(50)
theme.menu_width  = dpi(70)

-- You can add as many variables as
-- you wish and access them by using
-- beautiful.variable in your rc.lua
--theme.bg_widget = "#cc0000"

-- Create icons
local close_normal_icon = cairo.ImageSurface.create(cairo.Format.ARGB32, 50, 50)
local cr = cairo.Context(close_normal_icon)
cr:translate(0, 8)
gears.shape.circle(cr, 35, 35)
cr:set_source(gears.color("#e06c7588"))
cr:fill_preserve()

local close_focus_icon = cairo.ImageSurface.create(cairo.Format.ARGB32, 50, 50)
local cr = cairo.Context(close_focus_icon)
cr:translate(0, 8)
gears.shape.circle(cr, 35, 35)
cr:set_source(gears.color("#e06c75ff"))
cr:fill_preserve()

local minimize_normal_icon = cairo.ImageSurface.create(cairo.Format.ARGB32, 50, 50)
local cr = cairo.Context(minimize_normal_icon)
cr:translate(0, 8)
gears.shape.circle(cr, 35, 35)
cr:set_source(gears.color("#e5c07b88"))
cr:fill_preserve()

local minimize_focus_icon = cairo.ImageSurface.create(cairo.Format.ARGB32, 50, 50)
local cr = cairo.Context(minimize_focus_icon)
cr:translate(0, 8)
gears.shape.circle(cr, 35, 35)
cr:set_source(gears.color("#e5c07bff"))
cr:fill_preserve()

local floating_normal_inactive_icon = cairo.ImageSurface.create(cairo.Format.ARGB32, 50, 50)
local cr = cairo.Context(floating_normal_inactive_icon)
cr:translate(0, 8)
gears.shape.circle(cr, 35, 35)
cr:set_source(gears.color("#61afef88"))
cr:fill_preserve()

local floating_focus_inactive_icon = cairo.ImageSurface.create(cairo.Format.ARGB32, 50, 50)
local cr = cairo.Context(floating_focus_inactive_icon)
cr:translate(0, 8)
gears.shape.circle(cr, 35, 35)
cr:set_source(gears.color("#61afefff"))
cr:fill_preserve()

local floating_normal_active_icon = cairo.ImageSurface.create(cairo.Format.ARGB32, 50, 50)
local cr = cairo.Context(floating_normal_active_icon)
cr:translate(0, 8)
gears.shape.circle(cr, 35, 35)
cr:set_source(gears.color("#c678dd88"))
cr:fill_preserve()

local floating_focus_active_icon = cairo.ImageSurface.create(cairo.Format.ARGB32, 50, 50)
local cr = cairo.Context(floating_focus_active_icon)
cr:translate(0, 8)
gears.shape.circle(cr, 35, 35)
cr:set_source(gears.color("#c678ddff"))
cr:fill_preserve()

theme.titlebar_close_button_normal = close_normal_icon
theme.titlebar_close_button_focus  = close_focus_icon

theme.titlebar_minimize_button_normal = minimize_normal_icon
theme.titlebar_minimize_button_focus  = minimize_focus_icon

theme.titlebar_floating_button_normal_inactive = floating_normal_inactive_icon
theme.titlebar_floating_button_focus_inactive  = floating_focus_inactive_icon
theme.titlebar_floating_button_normal_active = floating_normal_active_icon
theme.titlebar_floating_button_focus_active  = floating_focus_active_icon

theme.wallpaper = "/usr/share/backgrounds/wallpapers/blue-pond.jpg"

-- You can use your own layout icons like this:

local layout_icons_path = theme.icons.."layout/"

theme.layout_fairh = layout_icons_path.."fairhw.png"
theme.layout_fairv = layout_icons_path.."fairvw.png"
theme.layout_floating  = layout_icons_path.."floating.svg"
theme.layout_magnifier = layout_icons_path.."max.svg"
theme.layout_max = layout_icons_path.."max.svg"
theme.layout_fullscreen = layout_icons_path.."fullscreen.svg"
theme.layout_tilebottom = layout_icons_path.."tilebottomw.png"
theme.layout_tileleft   = layout_icons_path.."tileleftw.png"
theme.layout_tile = layout_icons_path.."tile.svg"
theme.layout_tiletop = layout_icons_path.."tiletopw.png"
theme.layout_spiral  = layout_icons_path.."spiralw.png"
theme.layout_dwindle = layout_icons_path.."dwindle.svg"
theme.layout_cornernw = layout_icons_path.."cornernww.png"
theme.layout_cornerne = layout_icons_path.."cornernew.png"
theme.layout_cornersw = layout_icons_path.."cornersww.png"
theme.layout_cornerse = layout_icons_path.."cornersew.png"

-- Generate Awesome icon:
theme.awesome_icon = theme_assets.awesome_icon(
    theme.menu_height, theme.bg_focus, theme.fg_focus
)

-- Define the icon theme for application icons. If not set then the icons
-- from /usr/share/icons and /usr/share/icons/hicolor will be used.
theme.icon_theme = "/usr/share/icons/Papirus-Light"

return theme

-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80
