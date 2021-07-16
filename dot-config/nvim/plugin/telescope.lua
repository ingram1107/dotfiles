-- telescope conf
require('telescope').setup {
  defaults = {
    sorting_strategy = "ascending",
    layout_config = {
      horizontal = {
        width = 0.95,
        height = 0.85,
        preview_width = 0.6,
      },
      vertical = {
        width = 0.5,
        height = 0.5,
      },
    },
    color_devicons = true,
  }
}
