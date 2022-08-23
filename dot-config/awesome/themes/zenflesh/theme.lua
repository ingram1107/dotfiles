---------------------------
--        zenflesh       --
---------------------------

local theme_assets = require('beautiful.theme_assets')
local xresources = require('beautiful.xresources')
local dpi = xresources.apply_dpi

local gfs = require('gears.filesystem')
local themes_path = gfs.get_themes_dir()

local theme = {}

theme.font = 'JetBrainsMono Nerd Font 12'

theme.bg_normal = '#1c1917'
theme.bg_focus = '#3d4042'
theme.bg_urgent = '#de6e7c'
theme.bg_minimize = '#888f94'
theme.bg_systray = theme.bg_normal
theme.tag_bg = theme.bg_normal

theme.fg_normal = '#b4bdc3'
theme.fg_focus = '#b4bdc3'
theme.fg_urgent = '#b4bdc3'
theme.fg_minimize = '#1c1917'
theme.tag_fg_focus = '#b4bdc3'
theme.tag_fg_urgent = theme.bg_urgent
theme.tag_fg_occupied = theme.bg_minimize
theme.tag_fg_empty = theme.bg_focus

theme.useless_gap = dpi(0)
theme.border_width = dpi(1)
theme.border_normal = theme.bg_normal
theme.border_focus = theme.bg_normal
theme.border_marked = theme.bg_normal
theme.taglist_bg_empty = theme.tag_bg
theme.taglist_fg_empty = theme.tag_fg_empty
theme.taglist_bg_focus = theme.tag_bg
theme.taglist_fg_focus = theme.tag_fg_focus
theme.taglist_bg_urgent = theme.tag_bg
theme.taglist_fg_urgent = theme.tag_fg_urgent
theme.taglist_bg_occupied = theme.tag_bg
theme.taglist_fg_occupied = theme.tag_fg_occupied

-- bling modules customisation
theme.tabbed_spawn_in_tab = false
theme.tabbar_ontop = false
theme.tabbar_radius = 0
theme.tabbar_style = 'default'
theme.tabbar_font = 'JetBrainsMono Nerd Font 12'
theme.tabbar_size = 20
theme.tabbar_position = 'bottom'
theme.tabbar_bg_normal = theme.bg_minimize
theme.tabbar_fg_normal = theme.fg_minimize
theme.tabbar_bg_focus = theme.bg_focus
theme.tabbar_fg_focus = theme.fg_focus

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
-- Example:
--theme.taglist_bg_focus = "#ff0000"

-- Variables set for theming notifications:
-- notification_font
-- notification_[bg|fg]
-- notification_[width|height|margin]
-- notification_[border_color|border_width|shape|opacity]

-- You can add as many variables as
-- you wish and access them by using
-- beautiful.variable in your rc.lua
--theme.bg_widget = "#cc0000"

theme.wallpaper = '~/Pictures/wallpaper.jpg'

-- theme.tasklist_disable_task_name = true
theme.taglist_font = "Font Awesome 12"
theme.tasklist_disable_icon = true
theme.tasklist_align = "center"

return theme

-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80
