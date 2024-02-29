-- Initial setup
local function bootstrap_lazy()
  local lazy_path = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'

  if not vim.loop.fs_stat(lazy_path) then
    vim.fn.system({
      'git',
      'clone',
      '--filter=blob.none',
      'https://github.com/folke/lazy.nvim.git',
      '--branch=stable',
      lazy_path
    })
  end

  vim.opt.rtp:prepend(lazy_path)
end

bootstrap_lazy()

if vim.loader then
 vim.loader.enable()
end

-- basic settings
vim.loader.enable()
require('options')
require('keymaps')
