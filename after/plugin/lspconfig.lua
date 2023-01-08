local lspconfig = require 'lspconfig'
local coq = require 'coq'

local lsp_flags = {
	debounce_text_changes = 150,
}

local configured_servers = {
	'clangd',
	'pyright',
	'tsserver',
	'rust_analyzer',
	'sumneko_lua',
	'tailwindcss',
	'prismals',
	'eslint',
    'vuels',
}

-- on attach lsp keybindings
local on_attach = function(client, bufnr)
	vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

	local bufopts = { noremap = true, silent = true, buffer = bufnr }

	keyset('n', 'gD', vim.lsp.buf.declaration, bufopts)
	keyset('n', 'gi', vim.lsp.buf.implementation, bufopts)
	keyset('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
	keyset('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
	keyset('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
    keyset('n', 'K', vim.lsp.buf.hover(), bufopts)
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

for i, server in pairs(configured_servers) do
	lspconfig[server].setup {
		coq.lsp_ensure_capabilities({
			on_attach = on_attach,
			lsp_flags = lsp_flags,
		})
	}
end
