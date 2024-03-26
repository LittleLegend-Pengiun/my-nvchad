local M = {}

-- local hightlights = require("configs.hightlights")

M.ui = {
	theme = "chadracula",
	-- hl_override = {
	-- 	CursorLine = {
	-- 		bg = "#333544",
	-- 	},
	-- },

	transparency = false,

	tabufline = {
		--  more opts
		order = { "treeOffset", "buffers", "tabs", "btns" },
	},
	statusline = {
		theme = "default",
		separator_style = { left = "█", right = "" },
		order = { "mode", "file", "git", "%=", "lsp_msg", "%=", "diagnostics", "lsp", "cwd", "cursor" },
		modules = {
			cursor = function()
				return "%#St_pos_sep#" .. "█" .. "%#St_pos_icon# %#St_Pos_text# L:%l | C:%c "
			end,
		},
	},
	nvdash = {
		load_on_startup = true,
		buttons = {
			{ "  Find File", "Spc f f", "Telescope find_files" },
			{ "󰙅  Open Nvim Tree", "Spc e", "NvimTreeOpen" },
			{ "󰈚  Recent Files", "Spc f o", "Telescope oldfiles" },
			{ "󰈭  Find Word", "Spc f w", "Telescope live_grep" },
			{ "  View Bookmarks", "Spc m a", "Telescope marks" },
			{ "  Change Themes", "Spc t h", "Telescope themes" },
			{ "  View Key Maps", "Spc c h", "NvCheatsheet" },
		},
	},
}

return M
