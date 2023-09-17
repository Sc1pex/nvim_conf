local on_attach = function(_, bufnr)
  local nmap = function(keys, func)
    vim.keymap.set('n', keys, func, { buffer = bufnr })
  end

  nmap('<leader>ca', vim.lsp.buf.code_action)

  nmap('gd', vim.lsp.buf.definition)
  nmap('gr', require('telescope.builtin').lsp_references)
  nmap('gI', vim.lsp.buf.implementation)
  nmap('<leader>D', vim.lsp.buf.type_definition)
  nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols)

  nmap('<F2>', vim.lsp.buf.rename)

  nmap('K', vim.lsp.buf.hover)
  nmap('<C-k>', vim.lsp.buf.signature_help)
  nmap('<leader>d', vim.diagnostic.open_float)

  nmap('gD', vim.lsp.buf.declaration)
end

local servers = {
  lua_ls = {
    Lua = {
      workspace = { checkThirdParty = false },
      telemetry = { enable = false },
    },
  },
}

require('neodev').setup()

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

local mason_lspconfig = require 'mason-lspconfig'
mason_lspconfig.setup {
  ensure_installed = vim.tbl_keys(servers),
}

mason_lspconfig.setup_handlers {
  function(server_name)
    require('lspconfig')[server_name].setup {
      capabilities = capabilities,
      on_attach = on_attach,
      settings = servers[server_name],
      filetypes = (servers[server_name] or {}).filetypes,
    }
  end
}

require("mason-null-ls").setup({
  ensure_installed = {
  },
  automatic_installation = false,
  handlers = {},
})
require("null-ls").setup({
  sources = {
  }
})
