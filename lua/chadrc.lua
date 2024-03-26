local M = {}
-- local hightlights = require("configs.hightlights")

-- Use this for default style
-- local custom_sep_style = { left = "█", right = "" }

-- Use this for minimal style
local sep_l = ""
local sep_r = "%#St_sep_r#" .. "" .. " %#ST_EmptySpace#"
local function gen_block(icon, txt, sep_l_hlgroup, iconHl_group, txt_hl_group)
	return sep_l_hlgroup .. sep_l .. iconHl_group .. icon .. " " .. txt_hl_group .. " " .. txt .. sep_r
end

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
	-- statusline = {
	-- 	theme = "default",
	-- 	separator_style = custom_sep_style,
	-- 	order = { "mode", "file", "git", "%=", "lsp_msg", "%=", "diagnostics", "lsp", "cwd", "cursor" },
	-- 	modules = {
	-- 		cursor = function()
	-- 			return "%#St_pos_sep#" .. custom_sep_style.left .. "%#St_pos_icon# %#St_Pos_text# L:%l | C:%c "
	-- 		end,
	-- 	},
	-- },
	statusline = {
		theme = "minimal",
		separator_style = "round",
		order = { "mode", "file", "git", "%=", "lsp_msg", "%=", "diagnostics", "lsp", "cursor", "cwd" },
		modules = {
			cursor = function()
				return gen_block("", "L:%l | C:%c", "%#St_Pos_sep#", "%#St_Pos_bg#", "%#St_Pos_txt#")
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
