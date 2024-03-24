local config = require("configs.grappleconf")
local plugin = {
	"cbochs/grapple.nvim",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		{ "nvim-tree/nvim-web-devicons", lazy = true },
	},
	opts = config.opts,
	keys = config.keys,
	config = function()
		require("grapple").setup(config.settings)
	end,
}

return plugin
