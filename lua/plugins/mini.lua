return {
	"nvim-mini/mini.nvim",
	version = false,
	config = function()
		-- Core editor
		require("mini.pairs").setup()
		require("mini.icons").setup()
		require("mini.surround").setup({
			mappings = {
				add = "gza", -- Add surrounding in Normal and Visual modes
				delete = "gzd", -- Delete surrounding
				find = "gzf", -- Find surrounding (to the right)
				find_left = "gzF", -- Find surrounding (to the left)
				highlight = "gzh", -- Highlight surrounding
				replace = "gzr", -- Replace surrounding
				update_n_lines = "gzn", -- Update `n_lines`
			},
		})
		require("mini.comment").setup()

		-- Misc
		-- Cmdline autocomplete and improvements
		require("mini.cmdline").setup()

		-- Nicer statusline
		require("mini.statusline").setup()
	end,
}
