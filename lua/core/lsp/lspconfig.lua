-- Set up LSP
use {
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",
	'neovim/nvim-lspconfig'
}

use {
	'folke/neodev.nvim'
}

local lspconfig = require 'lspconfig'

local neodev = require 'neodev'
neodev.setup()

local lsp_flags = {
	debounce_text_changes = 150,
}

local CONFIGURED_SERVERS = {
	'pyright',
	'tsserver',
	'rust_analyzer',
	'sumneko_lua',
	'tailwindcss',
	'prismals',
}

local on_attach = function(client, bufnr)
	vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

	local bufopts = { noremap = true, silent = true, buffer = bufnr }

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

	vim.api.nvim_create_autocmd('BufWritePre', {
		pattern = '*',
		callback = function()
			vim.lsp.buf.format()
		end
	})
end

for i, server in pairs(CONFIGURED_SERVERS) do
	lspconfig[server].setup {
		on_attach = on_attach,
		lsp_flags = lsp_flags,
	}
end

-- Enable format on save

-- lspconfig.eslint.setup({
--   on_attach = function(client, bufnr)
--     client.server_capabilities.documentFormattingProvider = true
--     if client.server_capabilities.documentFormattingProvider then
--       -- local au_lsp = vim.api.nvim_create_augroup("eslint_lsp", { clear = true })
--       vim.api.nvim_create_autocmd("BufWritePre", {
--         pattern = "*",
--         callback = function()
--           vim.lsp.buf.format({ async = true })
--         end,
--         -- group = au_lsp,
--       })
--     end
--   end,
-- 	lsp_flags = lsp_flags,
-- })

require("mason").setup()
require("mason-lspconfig").setup()
