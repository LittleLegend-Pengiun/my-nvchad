local plugins = {
	{
		"NeogitOrg/neogit",
		event = "VeryLazy",
		lazy = false,
		dependencies = {
			"nvim-lua/plenary.nvim", -- required
			"sindrets/diffview.nvim", -- optional - Diff integration

			-- Only one of these is needed, not both.
			"nvim-telescope/telescope.nvim", -- optional
			-- "ibhagwan/fzf-lua",              -- optional
		},
		config = function()
			local settings = require("configs.neogitconf")
			local neogit = require("neogit")
			neogit.setup(settings)

			-- Key map for quick access
			vim.keymap.set({ "n" }, "<leader>ng", ":Neogit <Esc>", {
				desc = "Toggle Neogit",
			})
			vim.keymap.set({ "v" }, "<leader>ng", "<Esc> :Neogit <Esc>", {
				desc = "Toggle Neogit",
			})
		end,
	},
}

return plugins
