local plugin = {
	{
		"utilyre/barbecue.nvim",
		event = { "BufReadPre" },
		name = "barbecue",
		version = "*",
		dependencies = {
			"SmiteshP/nvim-navic",
			"nvim-tree/nvim-web-devicons", -- optional dependency
		},
		-- opts = {},
		opts = require("configs.barbecueconf").config, -- configurations go here
		config = function()
			-- triggers CursorHold event faster
			vim.opt.updatetime = 200

			require("barbecue").setup({
				create_autocmd = false, -- prevent barbecue from updating itself automatically
				attach_navic = false,
				theme = require("configs.barbecueconf").theme,
			})

			vim.api.nvim_create_autocmd({
				"WinScrolled", -- or WinResized on NVIM-v0.9 and higher
				"BufWinEnter",
				"CursorHold",
				"InsertLeave",

				-- include this if you have set `show_modified` to `true`
				"BufModifiedSet",
			}, {
				group = vim.api.nvim_create_augroup("barbecue.updater", {}),
				callback = function()
					require("barbecue.ui").update()
				end,
			})
		end,
	},
}

return plugin
