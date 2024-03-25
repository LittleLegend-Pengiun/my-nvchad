local plugin = {
	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		build = "cd app && yarn install",
		init = require("configs.md-previewconf"),
		ft = { "markdown" },
	},
}

return plugin
