-- lualine conf
local function lsp_status()
  local error_count = vim.lsp.diagnostic.get_count(0, [[Error]])
  local warning_count = vim.lsp.diagnostic.get_count(0, [[Warning]])

  return " : "..error_count.."  : "..warning_count
end

require('lualine').setup {
  options = {
    section_separators = { left = '', right = ''},
    component_separators = { left ='', right = ''},
  },
  sections = {
    lualine_a = { 'mode', },
    lualine_b = { 'branch', },
    lualine_c = { 'diff', 'filename', },
    lualine_x = { 'filetype', },
    lualine_y = { lsp_status },
    lualine_z = { 'progress', 'location', },
  },
}
