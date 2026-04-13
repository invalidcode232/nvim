return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		{
			"mason-org/mason.nvim",
			opts = {},
		},
		{ "mason-org/mason-lspconfig.nvim", config = function() end },
	},
}
