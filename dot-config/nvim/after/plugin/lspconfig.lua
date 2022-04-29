-- lspconfig
local lspconfig = require('lspconfig')
local configs = require('lspconfig/configs')
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

--- on_attach func
local on_attach = function(client, bufnr)
  local function buf_set_option(...)
    vim.api.nvim_buf_set_option(bufnr, ...)
  end

  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  --- mappings
  local opts = { buffer = true, silent = true }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
  vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
  vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
  vim.keymap.set('n', '<c-k>', vim.lsp.buf.signature_help, opts)
  vim.keymap.set('i', '<c-e>', vim.lsp.buf.signature_help, opts)
  vim.keymap.set('n', 'gwa', vim.lsp.buf.add_workspace_folder, opts)
  vim.keymap.set('n', 'gwr', vim.lsp.buf.remove_workspace_folder, opts)
  vim.keymap.set('n', 'gwl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, opts)
  vim.keymap.set('n', 'gld', vim.lsp.buf.type_definition, opts)
  vim.keymap.set('n', 'gR', vim.lsp.buf.rename, opts)
  vim.keymap.set('n', 'gle', vim.diagnostic.open_float, opts)
  vim.keymap.set('n', 'glq', vim.diagnostic.setloclist, opts)

  vim.cmd([[
  sign define DiagnosticSignError text= texthl=DiagnosticSignError linehl= numhl=
  sign define DiagnosticSignWarn text= texthl=DiagnosticSignWarn linehl= numhl=
  sign define DiagnosticSignHint text= texthl=DiagnosticSignHint linehl= numhl=
  sign define DiagnosticSignInfo text= texthl=DiagnosticSignInfo linehl= numhl=
  ]])

  --- set keybind for lsp formatting based on server capability
  if client.resolved_capabilities.document_formatting then
    vim.keymap.set('n', 'glf', vim.lsp.buf.formatting, opts)
  elseif client.resolved_capabilities.document_range_formatting then
    vim.keymap.set('n', 'glf', vim.lsp.buf.range_formatting, opts)
  end

  if client.resolved_capabilities.code_action then
    vim.keymap.set('n', 'gla', vim.lsp.buf.code_action, opts)
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
