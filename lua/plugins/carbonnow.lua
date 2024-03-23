local plugin = {
	{
		"ellisonleao/carbon-now.nvim",
		lazy = true,
		cmd = "CarbonNow",
		---@param opts cn.ConfigSchema
		config = function()
			local carbon = require("carbon-now")
			carbon.setup({
				options = {
					theme = "material",
					font_family = "Hack",
				},
				open_cmd = "open-cli",
			})
		end,
		opts = {},
	},
}

return plugin
