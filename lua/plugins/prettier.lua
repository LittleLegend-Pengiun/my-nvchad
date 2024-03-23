local plugin = {
	{
		"williamboman/mason.nvim",
		event = { "BufReadPre", "BufNewFile" },
		opts = function(_, opts)
			table.insert(opts.ensure_installed, "prettier")
		end,
	},
}

return plugin
