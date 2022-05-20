---------------------------
--          zhi          --
---------------------------

local xresources = require('beautiful.xresources')
local dpi = xresources.apply_dpi

local theme = {}

theme.font = 'JetBrainsMono Nerd Font 8'

theme.bg_normal = '#fbf7b7'
theme.bg_focus = '#f6ee65'
theme.bg_urgent = '#57021e'
theme.bg_minimize = '#f9f28e'
theme.bg_systray = theme.bg_normal
theme.tag_bg = theme.bg_normal

theme.fg_normal = '#2a2c2b'
theme.fg_focus = theme.fg_normal
theme.fg_urgent = '#f9f28e'
theme.fg_minimize = theme.fg_normal
theme.tag_fg_focus = theme.fg_normal
theme.tag_fg_urgent = theme.bg_urgent
theme.tag_fg_occupied = '#b3b6b5'
theme.tag_fg_empty = theme.bg_normal

theme.useless_gap = dpi(0)
theme.border_width = dpi(1)
theme.border_normal = '#b3b6b5'
theme.border_focus = theme.bg_focus
theme.border_marked = theme.bg_urgent
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
theme.tabbar_font = 'JetBrainsMono Nerd Font 10'
theme.tabbar_size = 20
theme.tabbar_position = 'bottom'
theme.tabbar_bg_normal = theme.bg_minimize
theme.tabbar_fg_normal = theme.fg_minimize
theme.tabbar_bg_focus = theme.bg_focus
theme.tabbar_fg_focus = theme.fg_focus

theme.wallpaper = '~/Pictures/wallpaper.jpg'

-- theme.tasklist_disable_task_name = true
theme.taglist_font = "Font Awesome 9"
theme.tasklist_disable_icon = true
theme.tasklist_align = "center"

return theme
