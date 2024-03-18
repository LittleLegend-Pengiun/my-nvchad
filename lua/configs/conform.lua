local options = {
	-- lsp_fallback = true,

	formatters_by_ft = {
		lua = { "stylua" },
		javascript = { "prettier" },
		typescript = { "prettier" },
		javascriptreact = { "prettier" },
		typescriptreact = { "prettier" },
		css = { "prettier" },
		html = { "prettier" },
		json = { "prettier" },
		yaml = { "prettier" },
		markdown = { "prettier" },
		graphql = { "prettier" },
	},

	format_on_save = {
		lsp_fallback = true,
		async = false,
		timeout_ms = 500,
	},
}
-- require("conform").setup(options)

return options
