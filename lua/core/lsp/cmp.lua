use {
	'hrsh7th/cmp-nvim-lsp',
	'hrsh7th/cmp-buffer',
	'hrsh7th/cmp-path',
	'hrsh7th/cmp-cmdline',
	'hrsh7th/nvim-cmp',
}

use {
	'hrsh7th/cmp-vsnip',
	'hrsh7th/vim-vsnip'
}

use {
	'onsails/lspkind.nvim'
}

local lspconfig = require 'lspconfig'
local cmp = require 'cmp'
local lspkind = require 'lspkind'

local lsp_flags = {
  debounce_text_changes = 150,
}

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


local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

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
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      -- elseif luasnip.expand_or_jumpable() then
      --   luasnip.expand_or_jump()
      elseif has_words_before() then
        cmp.complete()
      else
        fallback()
      end
    end, { "i", "s" }),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),
	}),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' }, -- For vsnip users.
      { name = 'buffer' },
			{ name = 'copilot' },
    }),
	formatting = {
		format = lspkind.cmp_format({
			mode = 'symbol', -- show only symbol annotations
			maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
			ellipsis_char = '...', -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
		})
	}
})


