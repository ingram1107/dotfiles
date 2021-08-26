-- LaTeX filetype plugin
-- fix initial LaTeX weird syntax
vim.bo.filetype = "tex"
vim.wo.wrap = true
vim.wo.linebreak = true
vim.bo.textwidth = 80

-- vimtex conf
vim.g.vimtex_compiler_latexmk_engines = { _ = '-lualatex' }
vim.g.vimtex_compiler_latexrun_engines = { _ = 'lualatex' }
vim.g.vimtex_syntax_enabled = 0
