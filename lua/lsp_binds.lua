local lspconfig = require 'lspconfig'
local cmp = require 'cmp'

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

	-- Replaced by lspsaga
  -- keyset('n', 'gd', vim.lsp.buf.definition, bufopts)
  -- keyset('n', 'K', vim.lsp.buf.hover, bufopts)
  -- keyset('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  -- keyset('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
end

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

cmp.setup({
	snippet = {
      expand = function(args)
        vim.fn['vsnip#anonymous'](args.body) -- For `vsnip` users.
      end,
	},
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},
	mapping = cmp.mapping.preset.insert({
		['<C-b>'] = cmp.mapping.scroll_docs(-4),
		['<C-f>'] = cmp.mapping.scroll_docs(4),
		['<C-Space>'] = cmp.mapping.complete(),
		['<C-e>'] = cmp.mapping.abort(),
		['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
	}),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' }, -- For vsnip users.
      { name = 'buffer' },
    }),
})

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

-- Lspsaga Mappings
keyset('n', 'gd', '<cmd>Lspsaga peek_definition<CR>', silent)
keyset('n', '<leader>cd', '<cmd>Lspsaga show_cursor_diagnostics<CR>', silent)
keyset('n', '<leader>cd', '<cmd>Lspsaga show_line_diagnostics<CR>', silent)
keyset('n', 'rn', '<cmd>Lspsaga rename<CR>', silent)
keyset({'n','v'}, '<leader>ca', '<cmd>Lspsaga code_action<CR>', silent)
keyset('n', 'K', '<cmd>Lspsaga hover_doc<CR>', silent)
keyset('n', 'gh', '<cmd>Lspsaga lsp_finder<CR>', silent)
-- keyset('n','<leader>o', '<cmd>LSoutlineToggle<CR>',silent)

keyset('n', '<Space>gg', '<cmd>Lspsaga open_floaterm lazygit<CR>', silent)
keyset('t', '<A-x>', [[<C-\><C-n><cmd>Lspsaga close_floaterm<CR>]], silent)
