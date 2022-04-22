local ls = require('luasnip')
local t = ls.text_node

local M = {};

--- convenient newline
function M.newline(text)
  return t({ '', text })
end

return M
