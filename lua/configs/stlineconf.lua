-- Use this for default style
-- local custom_sep_style = { left = "█", right = "" }

-- Use this for minimal style
local sep_l = ""
local sep_r = "%#St_sep_r#" .. "" .. " %#ST_EmptySpace#"
local function gen_block(icon, txt, sep_l_hlgroup, iconHl_group, txt_hl_group)
	return sep_l_hlgroup .. sep_l .. iconHl_group .. icon .. " " .. txt_hl_group .. " " .. txt .. sep_r
end

local override_cursor = function()
	return gen_block("", "L:%l | C:%c", "%#St_Pos_sep#", "%#St_Pos_bg#", "%#St_Pos_txt#")
end
-- Config for default
-- local st_line = {
-- 	theme = "default",
-- 	separator_style = custom_sep_style,
-- 	order = { "mode", "file", "git", "%=", "lsp_msg", "%=", "diagnostics", "lsp", "cwd", "cursor" },
-- 	modules = {
-- 		cursor = function()
-- 			return "%#St_pos_sep#" .. custom_sep_style.left .. "%#St_pos_icon# %#St_Pos_text# L:%l | C:%c "
-- 		end,
-- 	},
-- } "󰈚"

-- config for minimal
local st_line = {
	theme = "minimal",
	separator_style = "round",
	order = { "mode", "cwd", "git", "%=", "lsp_msg", "%=", "diagnostics", "lsp", "cursor", "file" },
	modules = {
		cursor = override_cursor,
	},
}

return st_line
