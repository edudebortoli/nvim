return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			javascript = { "prettier" },
			typescript = { "prettier" },
			html = { "prettier" },
			json = { "prettier" },
			markdown = { "prettier" },
			javascriptreact = { "prettier" },
			typescriptreact = { "prettier" },
		},
		formatters = {
			prettier = {
				prepend_args = { "--no-semi" },
			},
		},
		format_on_save = {
			timeout_ms = 3000,
			lsp_fallback = true,
		},
	},
}
