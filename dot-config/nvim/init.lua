-- Render theme
vim.o.termguicolors = true

-- Load lazy.nvim config
require('config.lazy')

if vim.loader then
 vim.loader.enable()
end

-- basic settings
vim.loader.enable()
require('config.options')
require('config.keymaps')
