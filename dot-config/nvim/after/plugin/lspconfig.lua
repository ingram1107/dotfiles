-- lspconfig
local lspconfig = require('lspconfig')
local configs = require('lspconfig/configs')
local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
local lsp_flags = {
  debounce_text_changes = 150,
}

--- on_attach func
local on_attach = function(client, bufnr)
  local function buf_set_option(...)
    vim.api.nvim_buf_set_option(bufnr, ...)
  end

  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  --- mappings
  local function set_opts(desc)
    return {
      buffer = true,
      silent = true,
      desc = desc,
    }
  end

  local opts = { buffer = true, silent = true }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, set_opts("LSP jump to declaraction"))
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, set_opts("LSP jump to definition"))
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, set_opts("LSP list all references"))
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, set_opts("LSP list all implementation"))
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, set_opts("LSP hover"))
  vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, set_opts("LSP go to previous diagnostic"))
  vim.keymap.set('n', ']d', vim.diagnostic.goto_next, set_opts("LSP go to next diagnostic"))
  vim.keymap.set('n', '<c-k>', vim.lsp.buf.signature_help, set_opts("LSP get signature help"))
  vim.keymap.set('i', '<c-e>', vim.lsp.buf.signature_help, set_opts("LSP get signature help"))
  vim.keymap.set('n', 'gwa', vim.lsp.buf.add_workspace_folder, set_opts("LSP add workspace folder"))
  vim.keymap.set('n', 'gwr', vim.lsp.buf.remove_workspace_folder, set_opts("LSP remove workspace folder"))
  vim.keymap.set('n', 'gwl', function()
    vim.pretty_print(vim.lsp.buf.list_workspace_folders())
  end, set_opts("LSP list workspace folders"))
  vim.keymap.set('n', 'gld', vim.lsp.buf.type_definition, set_opts("LSP jump to type definition"))
  vim.keymap.set('n', 'gR', vim.lsp.buf.rename, set_opts("LSP rename"))
  vim.keymap.set('n', 'gle', vim.diagnostic.open_float, set_opts("LSP open diagnostic in a float window"))
  vim.keymap.set('n', 'glq', vim.diagnostic.setloclist, set_opts("LSP add diagnostics to locallist"))
  vim.keymap.set('n', 'gla', vim.lsp.buf.code_action, set_opts("LSP code action"))

  vim.cmd([[
  sign define DiagnosticSignError text= texthl=DiagnosticSignError linehl= numhl=
  sign define DiagnosticSignWarn text= texthl=DiagnosticSignWarn linehl= numhl=
  sign define DiagnosticSignHint text= texthl=DiagnosticSignHint linehl= numhl=
  sign define DiagnosticSignInfo text= texthl=DiagnosticSignInfo linehl= numhl=
  ]])

  --- set keybind for lsp formatting based on server capability
  if client.server_capabilities.document_formatting then
    vim.keymap.set('n', 'glf', vim.lsp.buf.formatting, set_opts("LSP formatting"))
  elseif client.server_capabilities.document_range_formatting then
    vim.keymap.set('n', 'glf', vim.lsp.buf.range_formatting, set_opts("LSP formatting"))
  end

  -- inlay type hint
  vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
end

--- clangd: C/C++/Obj-C
lspconfig['clangd'].setup({
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
  flags = lsp_flags,
})

--- lua_ls: Lua
lspconfig.lua_ls.setup({
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
  flags = lsp_flags,
})

--- jedi_language_server: Python
lspconfig['jedi_language_server'].setup({
  startupMessage = false,

  -- jediSettings = {
  --   autoImportModules: to load heavy modules
  -- },

  completion = {
    disableSnippets = true,
  },

  on_attach = on_attach,
  capabilities = capabilities,
  flags = lsp_flags,
})

--- jdtls: Java
lspconfig['jdtls'].setup({
  capabilities = capabilities,
  flags = lsp_flags,
})

local en_dict = io.open(os.getenv('XDG_CONFIG_HOME') .. '/nvim/spell/en.utf-8.add')
local en_words = {}

if en_dict ~= nil then
  for word in en_dict:lines() do
    table.insert(en_words, word)
  end
end

-- LTeX: Natural languages
lspconfig['ltex'].setup({
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
      dictionary = {
        ['en-GB'] = en_words,
      },
      additionalRules = {
        enablePickyRules = true,
      },
      disabledRules = {
        ['en-GB'] = {
          'OXFORD_SPELLING_NOUNS',
          'OXFORD_SPELLING_VERBS',
          'OXFORD_SPELLING_ADJECTIVES',
          'OXFORD_SPELLING_ADVERBS',
          'OXFORD_SPELLING_Z_NOT_S',
        },
      },
      checkFrequency = 'save',
    },
  },
  on_attach = on_attach,
  capabilities = capabilities,
  flags = lsp_flags,
})

-- Fennel: fennel-ls
lspconfig['fennel_ls'].setup({})

-- arduino_language_server: Arduino
lspconfig['arduino_language_server'].setup({})

-- Ocaml: ocaml-lsp-server
lspconfig['ocamllsp'].setup({})

-- Rust: rust-analyzer
lspconfig['rust_analyzer'].setup({})

-- LaTeX: texlab
lspconfig['texlab'].setup({
  build = {
    args = { '-lualatex', '%f' },
  },
})
