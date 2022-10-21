use {
	'kyazdani42/nvim-web-devicons'
}

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local function setup()
	require 'core.ui.nvim-tree'
	require 'core.ui.alpha'
	require 'core.ui.barbar'
	require 'core.ui.colors'
	require 'core.ui.lualine'
	require 'core.ui.telescope'
end

return {
	setup = setup,
}
