use {
	'akinsho/bufferline.nvim',
	tag = "v3.*",
	requires = 'kyazdani42/nvim-web-devicons'
}

require("bufferline").setup {
	options = {
  offsets = {
    {
      filetype = "NvimTree",
      text = function()
        return vim.fn.getcwd()
      end,
      highlight = "Directory",
      text_align = "left"
    }
  }

	}
}

-- local view = require'nvim-tree.view'
--
-- if view.win_open() then
-- 	require'nvim-tree'.close()
-- 	require'bufferline.state'.set_offset(0)
-- else
-- 	require'bufferline.state'.set_offset(31, 'File Explorer')
-- 	require'nvim-tree'.find_file(true)
-- end
--
