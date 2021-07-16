-- lspconfig
local lspconfig = require('lspconfig')
--- on_attach func
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  --- mappings
  local opts = { noremap = true, silent = true }
  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<cr>', opts)
  buf_set_keymap('n', '<c-k>', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
  buf_set_keymap('n', '<leader>lwa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<cr>', opts)
  buf_set_keymap('n', '<leader>lwr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<cr>', opts)
  buf_set_keymap('n', '<leader>lwl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<cr>', opts)
  buf_set_keymap('n', '<leader>lD', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
  buf_set_keymap('n', '<leader>lr', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
  buf_set_keymap('n', '<leader>le', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<cr>', opts)
  buf_set_keymap('n', '<leader>lq', '<cmd>lua vim.lsp.diagnostic.set_loclist()<cr>', opts)

  vim.api.nvim_exec([[
    sign define LspDiagnosticsSignError text= texthl=LspDiagnosticsDefaultError linehl= numhl=
    sign define LspDiagnosticsSignWarning text= texthl=LspDiagnosticsDefaultWarning linehl= numhl=
    sign define LspDiagnosticsSignHint text= texthl=LspDiagnosticsDefaultHint linehl= numhl=
    sign define LspDiagnosticsSignInformation text= texthl=LspDiagnosticsDefaultInformation linehl= numhl=
    ]], false)

  --- use document highlight based on server capability
  if client.resolved_capabilities.document_highlight then
    vim.api.nvim_exec([[
    aug LspDocHighlight
      au! * <buffer>
      au CursorHold <buffer> lua vim.lsp.buf.document_highlight()
      au CursorHold <buffer> lua vim.lsp.buf.document_highlight()
      au CursorHold <buffer> lua vim.lsp.buf.clear_references()
    aug END
    ]], false)
  end

  --- set keybind for lsp formatting based on server capability
  if client.resolved_capabilities.document_formatting then
    buf_set_keymap("n", "<space>lf", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
  elseif client.resolved_capabilities.document_range_formatting then
    buf_set_keymap("n", "<space>lf", "<cmd>lua vim.lsp.buf.range_formatting()<CR>", opts)
  end

  if client.resolved_capabilities.code_action then
    buf_set_keymap('n', '<leader>la', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
  end
end

--- clangd: C/C++/Obj-C
lspconfig.clangd.setup {
  cmd = {
    'clangd',
    '--background-index',
    '--suggest-missing-includes',
    '--clang-tidy',
    '--header-insertion=iwyu',
  },
  on_attach = on_attach,
}

--- nlua: nvim lua dev
local sumneko_root_path = '/usr/share/lua-language-server/'
local sumneko_binary = '/usr/bin/lua-language-server'
require('nlua/lsp/nvim').setup(lspconfig, {
  cmd = {
    sumneko_binary,
    '-E',
    sumneko_root_path .. 'main.lua'
  },
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
        path = vim.split(package.path, ';'),
      },
      diagnostics = {
        enable = true,
        globals = { 'vim' },
        workspace = {
          library = {
            [vim.fn.expand('$VIMRUNTIME/lua')] = true,
            [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
          },
        },
      },
    },
  },
  on_attach = on_attach,
})

--- jedi_language_server: Python
lspconfig.jedi_language_server.setup {
  startupMessage = false,

  -- jediSettings = {
  --   autoImportModules: to load heavy modules
  -- },

  completion = {
    disableSnippets = true,
  },

  on_attach = on_attach,
}
