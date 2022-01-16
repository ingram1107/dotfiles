-- lualine conf
local function lsp_status()
  local error_count = #vim.diagnostic.get(0, {severity = vim.diagnostic.severity.ERROR})
  local warning_count = #vim.diagnostic.get(0, {severity = vim.diagnostic.severity.WARN})

  return "E : "..error_count.." W : "..warning_count
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
