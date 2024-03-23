local plugin = {
	{
		"f-person/git-blame.nvim",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("gitblame").setup({
				enabled = true,
				message_template = "<committer> • <date> • <summary>",
				date_format = "%r",
				message_when_not_committed = "You • Not committed!",
				schedule_event = "CursorMoved",
			})
		end,
	},
}

return plugin
