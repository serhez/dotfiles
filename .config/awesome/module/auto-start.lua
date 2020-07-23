local awful = require('awful')
local apps = require('conf.apps')

local function run_once(cmd)
  local findme = cmd
  local firstspace = cmd:find(' ')
  if firstspace then
    findme = cmd:sub(0, firstspace - 1)
  end
  awful.spawn.with_shell(string.format('pgrep -u $USER -x %s > /dev/null || (%s)', findme, cmd), false)
end

for _, app in ipairs(apps.run_on_start_up) do
  run_once(app)
end
