local base_plugins = {
	{
		"stevearc/conform.nvim",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			local conform = require("conform")
			local options = require("configs.conform")

			conform.setup(options)

			-- Bring the keymap from mappings.lua to here
			vim.keymap.set({ "n", "v" }, "<leader>fm", function()
				conform.format({
					lsp_fallback = true,
					async = false,
					timeout_ms = 500,
				})
			end, { desc = "Format file or range with Conform" })
		end,
	},

	{
		"nvim-tree/nvim-tree.lua",
		lazy = true,
		cmd = "NvimTreeOpen",
		opts = {
			git = { enable = true },
		},
	},
	{
		"nvim-treesitter/nvim-treesitter",
		event = { "BufReadPre", "BufNewFile" },
		opts = {
			ensure_installed = {
				-- defaults
				"vim",
				"lua",
				"vimdoc",

				-- web dev
				"html",
				"css",
				"javascript",
				"typescript",
				"tsx",

				-- low level
				"go",
			},
		},
	},
	{
		"nvim-tree/nvim-web-devicons",
		lazy = true,
	},
}

return base_plugins
