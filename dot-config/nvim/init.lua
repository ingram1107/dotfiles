-- Initial setup
local packer_path = os.getenv('XDG_DATA_HOME') .. '/nvim/site/pack/packer/start/packer.nvim'

if vim.fn.isdirectory(packer_path) == 1 then
  local handler = io.popen('git clone --depth 1 https://github.com/wbthomason/packer.nvim ' .. packer_path)
  local result = handler:read('*a')
  vim.api.nvim_echo({{ result }}, true, {})
  vim.cmd([[
  packadd packer.nvim
  PackerSync
  ]])
end

-- basic settings
vim.loader.enable()
require('options')
require('keymaps')
