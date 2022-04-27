-- lspconfig
local lspconfig = require('lspconfig')
local configs = require('lspconfig/configs')
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

--- on_attach func
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...)
    vim.api.nvim_buf_set_keymap(bufnr, ...)
  end
  local function buf_set_option(...)
    vim.api.nvim_buf_set_option(bufnr, ...)
  end

  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  --- mappings
  local opts = { noremap = true, silent = true }
  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<cr>', opts)
  buf_set_keymap('n', '<c-k>', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
  buf_set_keymap('i', '<c-e>', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
  buf_set_keymap('n', 'gwa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<cr>', opts)
  buf_set_keymap('n', 'gwr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<cr>', opts)
  buf_set_keymap('n', 'gwl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<cr>', opts)
  buf_set_keymap('n', 'gld', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
  buf_set_keymap('n', 'gR', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
  buf_set_keymap('n', 'gle', '<cmd>lua vim.diagnostic.open_float()<cr>', opts)
  buf_set_keymap('n', 'glq', '<cmd>lua vim.diagnostic.setloclist()<cr>', opts)

  vim.cmd([[
  sign define DiagnosticSignError text= texthl=DiagnosticSignError linehl= numhl=
  sign define DiagnosticSignWarn text= texthl=DiagnosticSignWarn linehl= numhl=
  sign define DiagnosticSignHint text= texthl=DiagnosticSignHint linehl= numhl=
  sign define DiagnosticSignInfo text= texthl=DiagnosticSignInfo linehl= numhl=
  ]])

  --- set keybind for lsp formatting based on server capability
  if client.resolved_capabilities.document_formatting then
    buf_set_keymap('n', 'glf', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
  elseif client.resolved_capabilities.document_range_formatting then
    buf_set_keymap('n', 'glf', '<cmd>lua vim.lsp.buf.range_formatting()<CR>', opts)
  end

  if client.resolved_capabilities.code_action then
    buf_set_keymap('n', 'gla', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
  end
end

--- clangd: C/C++/Obj-C
lspconfig.clangd.setup({
  cmd = {
    'clangd',
    '--background-index',
    '--suggest-missing-includes',
    '--clang-tidy',
    '--header-insertion=iwyu',
  },
  -- init_options = {
  --   compilationDatabaseDirectory = 'cmake-build',
  -- },
  on_attach = on_attach,
  capabilities = capabilities,
})

--- nlua: nvim lua dev
local sumneko_root_path = '/usr/lib/lua-language-server/'
local sumneko_binary = '/usr/bin/lua-language-server'
require('nlua/lsp/nvim').setup(lspconfig, {
  cmd = {
    sumneko_binary,
    '-E',
    sumneko_root_path .. 'main.lua',
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
  capabilities = capabilities,
})

--- jedi_language_server: Python
lspconfig.jedi_language_server.setup({
  startupMessage = false,

  -- jediSettings = {
  --   autoImportModules: to load heavy modules
  -- },

  completion = {
    disableSnippets = true,
  },

  on_attach = on_attach,
  capabilities = capabilities,
})

--- jdtls: Java
lspconfig.jdtls.setup({
  capabilities = capabilities,
})

-- LTeX: Natural languages
lspconfig.ltex.setup({
  filetypes = {
    'NeogitCommitMessage',
    'bib',
    'gitcommit',
    'markdown',
    'norg',
    'org',
    'plaintex',
    'rnoweb',
    'rst',
    'tex',
  },
  settings = {
    ltex = {
      language = 'en-GB',
      additionalRules = {
        enablePickyRules = true,
      },
      checkFrequency = 'save',
    },
  },
  on_attach = on_attach,
  capabilities = capabilities,
})
