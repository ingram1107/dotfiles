-- lualine conf
local moneokai = { }

local colours = {
    black     = '#272822',
    red       = '#f92672',
    green     = '#a6e221',
    yellow    = '#e6db74',
    blue      = '#66d9ef',
    magenta   = '#ae81ff',
    cyan      = '#2ea6e2',
    white     = '#f8f8f0',
    gray      = '#49483e',
    lightgray = '#75715e',
    drakgray  = '#3c3d37',
}

moneokai.normal = {
  a = { bg = colours.cyan, fg = colours.black, gui = 'bold', },
  b = { bg = colours.drakgray, fg = colours.white, },
  c = { bg = colours.gray, fg = colours.white, },
}

moneokai.insert = {
  a = { bg = colours.green, fg = colours.black, gui = 'bold', },
  b = { bg = colours.drakgray, fg = colours.white, },
  c = { bg = colours.gray, fg = colours.white, },
}

moneokai.visual = {
  a = { bg = colours.magenta, fg = colours.black, gui = 'bold', },
  b = { bg = colours.drakgray, fg = colours.white, },
  c = { bg = colours.gray, fg = colours.white, },
}

moneokai.replace = {
  a = { bg = colours.yellow, fg = colours.black, gui = 'bold', },
  b = { bg = colours.drakgray, fg = colours.white, },
  c = { bg = colours.gray, fg = colours.white, },
}

moneokai.command = {
  a = { bg = colours.red, fg = colours.black, gui = 'bold', },
  b = { bg = colours.drakgray, fg = colours.white, },
  c = { bg = colours.gray, fg = colours.white },
}

moneokai.terminal = moneokai.command

moneokai.inactive = {
  a = { bg = colours.drakgray, fg = colours.gray, },
  b = { bg = colours.drakgray, fg = colours.gray, },
  c = { bg = colours.drakgray, fg = colours.gray, },
}

local function lsp_status()
  local error_count = vim.lsp.diagnostic.get_count(0, [[Error]])
  local warning_count = vim.lsp.diagnostic.get_count(0, [[Warning]])

  return " : "..error_count.."  : "..warning_count
end

require('lualine').setup {
  options = {
    theme = moneokai,
    section_separators = {'', ''},
    component_separators = {'', ''},
  },
  sections = {
    lualine_a = { 'mode', },
    lualine_b = { 'branch', },
    lualine_c = { 'diff', 'filename', },
    lualine_x = { 'filetype', },
    lualine_y = { 'location', 'progress', },
    lualine_z = { lsp_status, },
  },
}
