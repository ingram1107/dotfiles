-- lspconfig
local lspconfig = require('lspconfig')
local configs = require('lspconfig/configs')
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

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
  buf_set_keymap('i', '<c-e>', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
  buf_set_keymap('n', 'gwa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<cr>', opts)
  buf_set_keymap('n', 'gwr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<cr>', opts)
  buf_set_keymap('n', 'gwl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<cr>', opts)
  buf_set_keymap('n', 'gld', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
  buf_set_keymap('n', 'gR', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
  buf_set_keymap('n', 'gle', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<cr>', opts)
  buf_set_keymap('n', 'glq', '<cmd>lua vim.lsp.diagnostic.set_loclist()<cr>', opts)
  -- TODO: neovim commit a8c3d50fad94971ebfe9eeedf933bdd829e66787
  -- buf_set_keymap('n', '<leader>lq', '<cmd>lua vim.lsp.diagnostic.set_qflist()<cr>', opts)

  vim.api.nvim_exec([[
  sign define LspDiagnosticsSignError text= texthl=LspDiagnosticsDefaultError linehl= numhl=
  sign define LspDiagnosticsSignWarning text= texthl=LspDiagnosticsDefaultWarning linehl= numhl=
  sign define LspDiagnosticsSignHint text= texthl=LspDiagnosticsDefaultHint linehl= numhl=
  sign define LspDiagnosticsSignInformation text= texthl=LspDiagnosticsDefaultInformation linehl= numhl=
  ]], false)

  --- set keybind for lsp formatting based on server capability
  if client.resolved_capabilities.document_formatting then
    buf_set_keymap("n", "glf", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
  elseif client.resolved_capabilities.document_range_formatting then
    buf_set_keymap("n", "glf", "<cmd>lua vim.lsp.buf.range_formatting()<CR>", opts)
  end

  if client.resolved_capabilities.code_action then
    buf_set_keymap('n', 'gla', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
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
  -- init_options = {
  --   compilationDatabaseDirectory = 'cmake-build',
  -- },
  on_attach = on_attach,
  capabilities = capabilities,
}

--- nlua: nvim lua dev
local sumneko_root_path = '/usr/lib/lua-language-server/'
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
  capabilities = capabilities,
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
  capabilities = capabilities,
}

--- jdtls: Java
lspconfig.jdtls.setup {
  capabilities = capabilities,
}

-- zk: Zettelkastan
configs.zk = {
  default_config = {
    cmd = {'zk', 'lsp', '--log', '/tmp/zk-lsp.log'},
    filetypes = {'markdown'},
    root_dir = function()
      return vim.loop.cwd()
    end,
    settings = {}
  };
}

lspconfig.zk.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}
