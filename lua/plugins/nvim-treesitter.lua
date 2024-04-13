local plugin = {
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

				"regex",
				"bash",
			},
		},
	},
}

return plugin
