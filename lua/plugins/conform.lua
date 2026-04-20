return {
	"stevearc/conform.nvim",
	event = { "BufReadPost", "BufWritePost", "BufNewFile" },
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },

			python = { "isort", "black" },

			rust = { "rustfmt", lsp_format = "fallback" },

			javascript = { "oxfmt", "prettierd", "prettier", stop_after_first = true },
			typescript = { "oxfmt", "prettierd", "prettier", stop_after_first = true },
			json = { "oxfmt" },
		},
		format_on_save = {
			timeout_ms = 500,
			lsp_format = "fallback",
		},
	},
}
