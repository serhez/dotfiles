--[[--
Copyright (C) Sergio Hernandez - All Rights Reserved
Author: Sergio Hernandez <contact.sergiohernandez@gmail.com>
Date  : 25.08.2020
--]]--
local awful = require("awful")

awful.spawn("alacritty", { tag = "" })

return {
  -- List of apps to start by default on some actions
  default = {
    terminal = 'alacritty',
    editor = 'nvim',
    rofiappmenu = 'rofi -show drun -theme /home/ser/.config/rofi/themes/drun.rasi',
    --lock = 'mantablockscreen',
    restart = 'systemctl reboot',
    shutdown = 'systemctl poweroff',
    sleep = 'sleep 1 && mantablockscreen & systemctl hibernate',
    --quake = 'xfce4-terminal --title "QuakeTerminal"'
  },
  -- List of apps to start once on start-up
  run_on_start_up = {
    'picom -b --experimental-backends --backend glx --config /home/ser/.config/picom/picom.conf', -- Compositor
    -- 'blueman-applet', -- Bluetooth tray icon
    --'xfce4-power-manager --no-daemon --debug', -- Power manager
    --'/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 & eval $(gnome-keyring-daemon -s --components=pkcs11,secrets,ssh,gpg)', -- credential manager
    --'xrdb $HOME/.Xresources', -- X Colors
    --'nm-applet', -- NetworkManager Applet
    --'mantablockscreen'
  }
}
