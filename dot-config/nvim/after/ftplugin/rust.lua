-- rust ft conf
vim.api.nvim_exec('compiler cargo', false)
vim.bo.textwidth = 100
vim.bo.formatprg = 'rustfmt'
