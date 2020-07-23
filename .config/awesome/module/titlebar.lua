local awful = require("awful")
local gears = require("gears")
local beautiful = require("beautiful")
local wibox = require("wibox")

local dpi = beautiful.xresources.apply_dpi

awful.titlebar.enable_tooltip = false
awful.titlebar.fallback_name  = 'Client\'s name'

local titlebar_size = 20

function double_click_event_handler(double_click_event)
    if double_click_timer then
        double_click_timer:stop()
        double_click_timer = nil
        double_click_event()
        return
    end
    double_click_timer = gears.timer.start_new(0.20, function()
        double_click_timer = nil
        return false
    end)
end

client.connect_signal("request::titlebars", function(c)
	-- Buttons for moving/resizing functionality 
	local buttons = gears.table.join(
		awful.button(
			{}, 
			1, 
			function()
				double_click_event_handler(function()
					if c.floating then
						c.floating = false
						return
					end
          c.maximized = not c.maximized
          c:raise()
          return
				end)
				c:emit_signal("request::activate", "mouse_click", {raise = true})
        awful.mouse.client.move(c)
			end
		),
		awful.button(
			{}, 
			3, 
			function()
        c:emit_signal("request::activate", "mouse_click", {raise = true})
        awful.mouse.client.resize(c)
			end
		)
	)

  awful.titlebar(c, {position = "top", size = titlebar_size}) : setup {
    { -- Left
        buttons = buttons,
        layout  = wibox.layout.fixed.horizontal
    },
    { -- Middle
        buttons = buttons,
        layout  = wibox.layout.flex.horizontal
    },
    { -- Right
        awful.titlebar.widget.floatingbutton(c),
        awful.titlebar.widget.minimizebutton(c),
        awful.titlebar.widget.closebutton   (c),
        spacing = dpi(5),
        layout = wibox.layout.fixed.horizontal()
    },
    layout = wibox.layout.align.horizontal
  }
end)

client.connect_signal("manage", function(c)
		if not c.max and not c.hide_titlebars then
			awful.titlebar.show(c, c.titlebar_position or 'top')
		else
			awful.titlebar.hide(c, c.titlebar_position or 'top')
		end
end)

-- Catch the signal when a client's layout is changed
screen.connect_signal(
	"arrange", 
	function(s)
		for _, c in pairs(s.clients) do
			if (#s.tiled_clients > 1 or c.floating) and c.first_tag.layout.name ~= 'max' then
				if not c.hide_titlebars then
					awful.titlebar.show(c, c.titlebar_position or 'top')
				else 
					awful.titlebar.hide(c, c.titlebar_position or 'top')
				end
        c.shape = function(cr, w, h)
          gears.shape.rectangle(cr, w, h)
        end
			end
      if c.maximized then
        c.border_width = 0
      else
        c.border_width = beautiful.border_width
      end
		end
end)
