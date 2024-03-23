return {
	{
		"sontungexpt/stcursorword",
		event = { "BufReadPre" },
		config = true,
		config = function()
			require("configs.stcursorwordconf")
		end,
	},
}
