-- Statusline
use {
	'nvim-lualine/lualine.nvim'
}

require('lualine').setup({
	extensions = {
		'nvim-tree',
		'toggleterm',
	}
})
