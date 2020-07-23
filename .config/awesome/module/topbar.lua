local gears = require("gears")
local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")
local cairo = require("lgi").cairo
local os = require("os")

local topbar = {}

--local todo_widget = require("widget.todo")
local volume_widget = require("widget.volume-widget.volume")
local spotify_widget = require("widget.spotify-widget.spotify")
local clock_widget = {
    {
        widget = wibox.widget.textclock,
        font = "Noto Sans 9"
    },
    bottom = 1,
    widget = wibox.container.margin
}
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

-- Create a wibox for each screen and add it
local taglist_buttons = gears.table.join(
                    awful.button({ }, 1, function(t) t:view_only() end),
                    awful.button({ modkey }, 1, function(t)
                                              if client.focus then
                                                  client.focus:move_to_tag(t)
                                              end
                                          end),
                    awful.button({ }, 3, awful.tag.viewtoggle),
                    awful.button({ modkey }, 3, function(t)
                                              if client.focus then
                                                  client.focus:toggle_tag(t)
                                              end
                                          end),
                    awful.button({ }, 4, function(t) awful.tag.viewnext(t.screen) end),
                    awful.button({ }, 5, function(t) awful.tag.viewprev(t.screen) end)
                )

local tasklist_buttons = gears.table.join(
                     awful.button({ }, 1, function (c)
                                              if c == client.focus then
                                                  c.minimized = true
                                              else
                                                  c:emit_signal(
                                                      "request::activate",
                                                      "tasklist",
                                                      {raise = true}
                                                  )
                                              end
                                          end),
                     awful.button({ }, 3, function()
                                              awful.menu.client_list({ theme = { width = 250 } })
                                          end),
                     awful.button({ }, 4, function ()
                                              awful.client.focus.byidx(1)
                                          end),
                     awful.button({ }, 5, function ()
                                              awful.client.focus.byidx(-1)
                                          end))

-- local menu_icon = cairo.ImageSurface.create(cairo.Format.ARGB32, 10, 35)
-- local cr = cairo.Context(menu_icon)
-- gears.shape.rectangle(cr, 50, 50)
-- cr:set_source(gears.color("#49515f88"))
-- cr:fill_preserve()

-- menu_content = {
--    { "Shut down", "shutdown now" },
--    { "Restart", "reboot" }
-- }
-- menu = awful.menu({ items = menu_content, theme = { 
--     font = 'Noto Sans 10',
--     height = 30,
--     width = 100,
--     bg_color = '#282c3488'
-- } })
-- local function showmenu()
--   s = awful.screen.focused()
--   m_coords = {
--     x = s.geometry.x + s.workarea.width/2-100,
--     y = s.geometry.y + s.workarea.height/2-120
--   }
--   menu:show({coords=m_coords})
-- end
-- launcher = awful.widget.launcher({ image = menu_icon })
-- client.connect_signal("launcher::press", function(c) showmenu() end)

local function setup(s)
    -- Each screen has its own tag table.
    awful.tag.add("", {
        layout             = awful.layout.suit.spiral.dwindle,
        screen             = s,
        selected           = true,
    })
    awful.tag.add("", {
        layout             = awful.layout.suit.floating,
        screen             = s,
    })
    awful.tag.add("", {
        layout             = awful.layout.suit.spiral.dwindle,
        screen             = s,
    })
    awful.tag.add("", {
        layout             = awful.layout.suit.floating,
        screen             = s,
    })
    awful.tag.add("", {
        layout             = awful.layout.suit.floating,
        screen             = s,
    })
    awful.tag.add("", {
        layout             = awful.layout.suit.floating,
        screen             = s,
    })

    -- Create a promptbox for each screen
    s.mypromptbox = awful.widget.prompt()
    -- Create an imagebox widget which will contain an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    s.mylayoutbox = awful.widget.layoutbox(s)
    s.mylayoutbox:buttons(gears.table.join(
                           awful.button({ }, 1, function () awful.layout.inc( 1) end),
                           awful.button({ }, 3, function () awful.layout.inc(-1) end),
                           awful.button({ }, 4, function () awful.layout.inc( 1) end),
                           awful.button({ }, 5, function () awful.layout.inc(-1) end)))
    -- Create a taglist widget
    s.mytaglist = awful.widget.taglist {
        screen  = s,
        filter  = awful.widget.taglist.filter.all,
        buttons = taglist_buttons,
        style   = { squares_resize = false },
        widget_template = {
          {
              {
                  layout = wibox.layout.fixed.vertical,
                  {
                      {
                          left = 20,
                          right = 20,
                          top = 3,
                          widget = wibox.container.margin
                      },
                      id = 'overline',
                      shape = gears.shape.rectangle,
                      widget = wibox.container.background
                  },
                  {
                      {
                          id = 'text_role',
                          align  = 'center',
                          valign = 'center',
                          font = 'FontAwesome5Free 12',
                          widget = wibox.widget.textbox
                      },
                      top = 7,
                      widget = wibox.container.margin
                  }
              },
              widget = wibox.container.margin
          },
          id = 'background_role',
          widget = wibox.container.background,
          shape = gears.shape.rectangle,
          create_callback = function(self, c3, index, objects)
              local focused = false
              for _, x in pairs(awful.screen.focused().selected_tags) do
                  if x.index == index then
                      focused = true
                      break
                  end
              end
              if focused then
                  self:get_children_by_id("overline")[1].bg = "#56b6c2ff"
              else 
                  self:get_children_by_id("overline")[1].bg = "#00000000"
              end
          end,
          update_callback = function(self, c3, index, objects)
              local focused = false
              for _, x in pairs(awful.screen.focused().selected_tags) do
                  if x.index == index then
                      focused = true
                      break
                  end
              end
              if focused then
                  self:get_children_by_id("overline")[1].bg = "#56b6c2ff"
              else 
                  self:get_children_by_id("overline")[1].bg = "#00000000"
              end
          end
      }
    }

    -- Create a tasklist widget
    s.mytasklist = awful.widget.tasklist {
      screen  = s,
      filter  = awful.widget.tasklist.filter.currenttags,
      buttons = tasklist_buttons,
      style   = { disable_task_name = true, spacing = 5 },
      widget_template = {
        {
            wibox.widget.base.make_widget(),
            forced_height = 3,
            id            = 'background_role',
            widget        = wibox.container.background,
        },
        {
            {
                id     = 'clienticon',
                widget = awful.widget.clienticon,
            },
            margins = 5,
            widget  = wibox.container.margin
        },
        nil,
        create_callback = function(self, c, index, objects) --luacheck: no unused args
            self:get_children_by_id('clienticon')[1].client = c
        end,
        layout = wibox.layout.align.vertical,
      },
    }
    
    -- Create the wibox
    s.mywibox = awful.wibar({ 
      position = "top", 
      screen = s, 
      height = 35, 
      bg = beautiful.transparent,
      --ontop = true
    })

    -- Add widgets to the wibox
    s.mywibox:setup {
        expand = "none",
        layout = wibox.layout.align.horizontal,
        { -- Left widgets
            layout = wibox.layout.fixed.horizontal,
            s.mytaglist,
            s.mypromptbox,
        },
        s.mytasklist, -- Middle widget
        { -- Right widgets
            {
                layout = wibox.layout.fixed.horizontal,
                wibox.widget.systray(),
                --todo_widget(),
                spotify_widget({
                   font = 'Noto Sans 9',
                   play_icon = "/home/ser/.config/awesome/themes/default/icons/spotify-widget/play.png",
                   pause_icon = "/home/ser/.config/awesome/themes/default/icons/spotify-widget/pause.png"
                }),
                separator,
                volume_widget({
                    main_color = '#98c379ff',
                    bg_color = '#49515fff',
                    mute_color = '#e06c75ff',
                    get_volume_cmd = 'pamixer --get-volume-human',
                    inc_volume_cmd = 'pamixer -i 5',
                    dec_volume_cmd = 'pamixer -d 5',
                    tog_volume_cmd = 'pamixer -t',
                    thickness = 3,
                    height = 25,
                }),
                separator,
                clock_widget,
                separator,
                {
                    s.mylayoutbox,
                    top = 5,
                    bottom = 5,
                    widget = wibox.container.margin
                },
                launcher,
                spacing = 15,
            },
            top = 0,
            bottom = 0,
            right = 10,
            widget  = wibox.container.margin
        }
    }
end

topbar.setup = setup

return topbar
