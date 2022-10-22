-- Set up LSP
use {
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",
	'neovim/nvim-lspconfig'
}

local lspconfig = require 'lspconfig'

-- Mappings.
local opts = { noremap=true, silent=true }
keyset('n', '<space>e', vim.diagnostic.open_float, opts)
keyset('n', '[d', vim.diagnostic.goto_prev, opts)
keyset('n', ']d', vim.diagnostic.goto_next, opts)
keyset('n', '<space>q', vim.diagnostic.setloclist, opts)

local CONFIGURED_SERVERS = {
  'pyright',
  'tsserver',
  -- 'rust_analyzer', replaced with rust-tools
  'sumneko_lua',
	'tailwindcss',
	'prismals',
}

for i, server in pairs(CONFIGURED_SERVERS) do
  lspconfig[server].setup {
    on_attach = on_attach,
    lsp_flags = lsp_flags,
  }
end

lspconfig.eslint.setup({
  on_attach = function(client, bufnr)
    client.server_capabilities.documentFormattingProvider = true
    if client.server_capabilities.documentFormattingProvider then
      local au_lsp = vim.api.nvim_create_augroup("eslint_lsp", { clear = true })
      vim.api.nvim_create_autocmd("BufWritePre", {
        pattern = "*",
        callback = function()
          vim.lsp.buf.format({ async = true })
        end,
        group = au_lsp,
      })
    end
  end,
	lsp_flags = lsp_flags,
})

require("mason").setup()
require("mason-lspconfig").setup()
