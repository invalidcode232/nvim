
-- Main colorscheme
use {
	'catppuccin/nvim',
	as = 'catppuccin',
	config = function()
		vim.g.catppuccin_flavour = 'mocha' -- latte, frappe, macchiato, mocha
		require('catppuccin').setup()
		vim.api.nvim_command 'colorscheme catppuccin'
	end
}
