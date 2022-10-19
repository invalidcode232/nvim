-- Nvim tree
use {
	"nvim-tree/nvim-tree.lua",
	tag = "nightly",
}

use {
	"kyazdani42/nvim-web-devicons"
}

-- Statusline
use {
	"nvim-lualine/lualine.nvim"
}

-- Main colorscheme
use {
	"catppuccin/nvim",
	as = "catppuccin",
	config = function()
		vim.g.catppuccin_flavour = "mocha" -- latte, frappe, macchiato, mocha
		require("catppuccin").setup()
		vim.api.nvim_command "colorscheme catppuccin"
	end
}

-- Cool dashboard
use {
	"goolord/alpha-nvim",
	requires = { "kyazdani42/nvim-web-devicons" },
	config = function()
		require "alpha".setup(require "alpha.themes.dashboard".config)
	end
}

-- Buffer (tabs) management
use {
	"romgrk/barbar.nvim",
	requires = { "kyazdani42/nvim-web-devicons" },
}

use {
	'nvim-telescope/telescope.nvim', tag = '0.1.0',
	-- or                            , branch = '0.1.x',
	requires = { { 'nvim-lua/plenary.nvim' } }
}

require("nvim-tree").setup()




-- require('lualine').setup {
--   options = {
--     component_separators = '|',
--     section_separators = { left = '', right = '' },
--   },
--   sections = {
--     lualine_a = {
--       { 'mode', right_padding = 2 },
--     },
--     lualine_b = { 'filename', 'branch' },
--     lualine_c = { 'fileformat' },
--     lualine_x = {},
--     lualine_y = { 'filetype', 'progress' },
--     lualine_z = {
--       { 'location', left_padding = 2 },
--     },
--   },
--   inactive_sections = {
--     lualine_a = { 'filename' },
--     lualine_b = {},
--     lualine_c = {},
--     lualine_x = {},
--     lualine_y = {},
--     lualine_z = { 'location' },
--   },
--   tabline = {},
--   extensions = {"nvim-tree"},
-- }

require("lualine").setup({
	extensions = {
		"nvim-tree"
	}
})


-- Fix BarBar with nvim-tree
local nvim_tree_events = require("nvim-tree.events")
local bufferline_api = require("bufferline.api")

local function get_tree_size()
	return require "nvim-tree.view".View.width
end

nvim_tree_events.subscribe("TreeOpen", function()
	bufferline_api.set_offset(get_tree_size())
end)

nvim_tree_events.subscribe("Resize", function()
	bufferline_api.set_offset(get_tree_size())
end)

nvim_tree_events.subscribe("TreeClose", function()
	bufferline_api.set_offset(0)
end)

-- Disable NetRw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
