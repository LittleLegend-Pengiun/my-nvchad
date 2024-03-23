local plugins = {
	{
		"NeogitOrg/neogit",
		cmd = "Neogit",
		dependencies = {
			"nvim-lua/plenary.nvim", -- required
			"sindrets/diffview.nvim", -- optional - Diff integration

			-- Only one of these is needed, not both.
			"nvim-telescope/telescope.nvim", -- optional. NvChad already use telescope
			-- "ibhagwan/fzf-lua",              -- optional
		},
		config = function()
			local settings = require("configs.neogitconf")
			local neogit = require("neogit")
			neogit.setup(settings)
		end,
	},
}

return plugins
