-------------------------------------------------
-- Spotify Widget for Awesome Window Manager
-- Shows currently playing song on Spotify for Linux client
-- More details could be found here:
-- https://github.com/streetturtle/awesome-wm-widgets/tree/master/spotify-widget

-- @author Pavel Makhov
-- @copyright 2018 Pavel Makhov
-------------------------------------------------

local awful = require("awful")
local wibox = require("wibox")
local watch = require("awful.widget.watch")
local gears = require("gears")

local GET_SPOTIFY_STATUS_CMD = 'sp status'
local GET_CURRENT_SONG_CMD = 'sp current-song'
local GET_CURRENT_ARTIST_CMD = 'sp current-artist'

local spotify_widget = {}

local separator = {
    {
        left = 1,
        right = 2,
        widget = wibox.container.margin
    },
    bg = "#49515f88",
    shape = gears.shape.rectangle,
    widget = wibox.container.background
}

local function worker(args)

    local args = args or {}

    local play_icon = args.play_icon
    local pause_icon = args.pause_icon
    local font = args.font 

    spotify_widget = wibox.widget {
        {
            {
                 {
                    left = 1,
                    right = 2,
                    widget = wibox.container.margin
                },
                bg = "#49515f88",
                shape = gears.shape.rectangle,
                widget = wibox.container.background
            },
            right = 10,
            widget = wibox.container.margin
        },
        {
            {
                id = "icon",
                resize = true,
                widget = wibox.widget.imagebox
            },
            id = "icon_container",
            top = 10,
            bottom = 10,
            widget = wibox.container.margin
        },
        {
            {
                {
                    id = 'artist',
                    widget = wibox.widget.textbox,
                    font = font,
                    valign = 'center'
                },
                id = "artist_constraint",
                strategy = "max",
                width = 150,
                widget = wibox.container.constraint
            },
            id = "artist_margin",
            bottom = 5,
            top = 5,
            widget = wibox.container.margin
        },
        {
            {
                widget = wibox.widget.textbox,
                font = font,
                text = "-",
                align = "center",
                valign = "center",
            },
            bottom = 5,
            top = 5,
            widget = wibox.container.margin
        },
        {
            {
                {
                    id = 'song',
                    widget = wibox.widget.textbox,
                    font = font,
                    valign = 'center'
                },
                id = "song_constraint",
                strategy = "max",
                width = 150,
                widget = wibox.container.constraint
            },
            id = "song_margin",
            bottom = 5,
            top = 5,
            widget = wibox.container.margin
        },
        spacing = 10,
        layout = wibox.layout.fixed.horizontal,
        set_status = function(self, is_playing)
            self.icon_container.icon.image = (is_playing and pause_icon or play_icon)
        end,
        set_song = function(self, path)
            self.song_margin.song_constraint.song.markup = path
        end,
        set_artist = function(self, path)
            self.artist_margin.artist_constraint.artist.markup = path
        end
    }

    local update_widget_icon = function(widget, stdout, _, _, _)
        stdout = string.gsub(stdout, "\n", "")
        widget:set_status(stdout == 'Playing' and true or false)
    end

    local update_song = function(widget, stdout, _, _, _)
        local escaped = string.gsub(stdout, "&", '&amp;')
        if string.find(stdout, 'Error: Spotify is not running.') ~= nil then
            widget:set_song('')
            widget:set_visible(false)
        else
            widget:set_song(escaped)
            widget:set_visible(true)
        end
    end
    
    local update_artist = function(widget, stdout, _, _, _)
        local escaped = string.gsub(stdout, "&", '&amp;')
        if string.find(stdout, 'Error: Spotify is not running.') ~= nil then
            widget:set_artist('')
            widget:set_visible(false)
        else
            widget:set_artist(escaped)
            widget:set_visible(true)
        end
    end

    watch(GET_SPOTIFY_STATUS_CMD, 1, update_widget_icon, spotify_widget)
    watch(GET_CURRENT_SONG_CMD, 1, update_song, spotify_widget)
    watch(GET_CURRENT_ARTIST_CMD, 1, update_artist, spotify_widget)

    --- Adds mouse controls to the widget:
    --  - left click - play/pause
    --  - scroll up - play next song
    --  - scroll down - play previous song
    spotify_widget:connect_signal("button::press", function(_, _, _, button)
        if (button == 1) then
            awful.spawn("sp play", false)      -- left click
        elseif (button == 4) then
            awful.spawn("sp next", false)  -- scroll up
        elseif (button == 5) then
            awful.spawn("sp prev", false)  -- scroll down
        end
        awful.spawn.easy_async(GET_SPOTIFY_STATUS_CMD, function(stdout, stderr, exitreason, exitcode)
            update_widget_icon(spotify_widget, stdout, stderr, exitreason, exitcode)
        end)
    end)

    return spotify_widget

end

return setmetatable(spotify_widget, { __call = function(_, ...)
    return worker(...)
end })
