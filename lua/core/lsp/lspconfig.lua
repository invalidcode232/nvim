-- Set up LSP
use {
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",
	'neovim/nvim-lspconfig'
}

-- local lspconfig = require 'lspconfig'

-- Mappings.
local opts = { noremap=true, silent=true }
keyset('n', '<space>e', vim.diagnostic.open_float, opts)
keyset('n', '[d', vim.diagnostic.goto_prev, opts)
keyset('n', ']d', vim.diagnostic.goto_next, opts)
keyset('n', '<space>q', vim.diagnostic.setloclist, opts)

local on_attach = function(client, bufnr)
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  local bufopts = { noremap=true, silent=true, buffer=bufnr }

  keyset('n', 'gD', vim.lsp.buf.declaration, bufopts)
  keyset('n', 'gi', vim.lsp.buf.implementation, bufopts)
  keyset('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  keyset('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  keyset('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  keyset('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  keyset('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  keyset('n', 'gr', vim.lsp.buf.references, bufopts)
  keyset('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)
end

require("mason").setup()
require("mason-lspconfig").setup()
