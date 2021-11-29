---------------------------
--        zenflesh       --
---------------------------

local theme_assets = require('beautiful.theme_assets')
local xresources = require('beautiful.xresources')
local dpi = xresources.apply_dpi

local gfs = require('gears.filesystem')
local themes_path = gfs.get_themes_dir()

local theme = {}

theme.font = 'IBMPlex Mono 8'

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
theme.tabbar_font = 'IBMPlexMono 10'
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

-- Variables set for theming the menu:
-- menu_[bg|fg]_[normal|focus]
-- menu_[border_color|border_width]
theme.menu_submenu_icon = themes_path .. 'default/submenu.png'
theme.menu_height = dpi(15)
theme.menu_width = dpi(100)

-- You can add as many variables as
-- you wish and access them by using
-- beautiful.variable in your rc.lua
--theme.bg_widget = "#cc0000"

theme.wallpaper = '~/Pictures/wallpaper.jpg'

-- You can use your own layout icons like this:
theme.layout_fairh = themes_path .. 'default/layouts/fairhw.png'
theme.layout_fairv = themes_path .. 'default/layouts/fairvw.png'
theme.layout_floating = themes_path .. 'default/layouts/floatingw.png'
theme.layout_magnifier = themes_path .. 'default/layouts/magnifierw.png'
theme.layout_max = themes_path .. 'default/layouts/maxw.png'
theme.layout_fullscreen = themes_path .. 'default/layouts/fullscreenw.png'
theme.layout_tilebottom = themes_path .. 'default/layouts/tilebottomw.png'
theme.layout_tileleft = themes_path .. 'default/layouts/tileleftw.png'
theme.layout_tile = themes_path .. 'default/layouts/tilew.png'
theme.layout_tiletop = themes_path .. 'default/layouts/tiletopw.png'
theme.layout_spiral = themes_path .. 'default/layouts/spiralw.png'
theme.layout_dwindle = themes_path .. 'default/layouts/dwindlew.png'
theme.layout_cornernw = themes_path .. 'default/layouts/cornernww.png'
theme.layout_cornerne = themes_path .. 'default/layouts/cornernew.png'
theme.layout_cornersw = themes_path .. 'default/layouts/cornersww.png'
theme.layout_cornerse = themes_path .. 'default/layouts/cornersew.png'

theme.tasklist_disable_task_name = true

return theme

-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80
