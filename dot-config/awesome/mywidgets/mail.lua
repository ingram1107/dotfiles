-- modification version of https://github.com/streetturtle/awesome-wm-widgets/blob/master/email-widget/email.lua
local wibox = require('wibox')
local awful = require('awful')
local path_to_icons = '/usr/share/icons/Arc/actions/22/'

local icon_widget = wibox.widget({
  {
    id = "icon",
    image = path_to_icons .. '/mail-message-new.png',
    widget = wibox.widget.imagebox,
  },
  valign = 'center',
  layout = wibox.container.place,
})

local text_widget = wibox.widget({
  forced_width = 30,
  align = 'center',
  widget = wibox.widget.textbox,
})

local mail_widget = wibox.widget({
  icon_widget,
  text_widget,
  layout = wibox.layout.fixed.horizontal,
})

awful.widget.watch({ awful.util.shell, '-c', 'newmail' }, 15, function(widget, stdout)
  local unread = tonumber(stdout) or 0
  text_widget.text = unread
  if unread > 0 then
    widget.icon:set_image(path_to_icons .. '/mail-mark-unread.png')
  elseif unread == 0 then
    widget.icon:set_image(path_to_icons .. '/mail-message-new.png')
  end
end, icon_widget)

return mail_widget
