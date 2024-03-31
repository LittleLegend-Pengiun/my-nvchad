-- Use this for default style
-- local custom_sep_style = { left = "█", right = "" }

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
-- }

-- Use this for minimal style
-- Helper functions
local sep_l = ""
local sep_r = "%#St_sep_r#" .. "" .. " %#ST_EmptySpace#"
local function gen_block(icon, txt, sep_l_hlgroup, iconHl_group, txt_hl_group)
	return sep_l_hlgroup .. sep_l .. iconHl_group .. icon .. " " .. txt_hl_group .. " " .. txt .. sep_r
end

local stbufnr = function()
	return vim.api.nvim_win_get_buf(vim.g.statusline_winid or 0)
end

local function trimString(input, max_length)
	if #input > max_length then
		return string.sub(input, 1, max_length - 3) .. "..."
	else
		return input
	end
end

local git = function()
	if not vim.b[stbufnr()].gitsigns_head or vim.b[stbufnr()].gitsigns_git_status then
		return { "unknown", "" }
	end

	local git_status = vim.b[stbufnr()].gitsigns_status_dict

	local added = (git_status.added and git_status.added ~= 0) and ("  " .. git_status.added) or ""
	local changed = (git_status.changed and git_status.changed ~= 0) and ("  " .. git_status.changed) or ""
	local removed = (git_status.removed and git_status.removed ~= 0) and ("  " .. git_status.removed) or ""
	local file_status = added .. changed .. removed

	return { trimString(git_status.head, 25), file_status }
	-- return " " .. branch_name .. added .. changed .. removed
end

-- Override functions
local git_branch = function()
	local branch_name = git()[1]
	if branch_name == "unknown" then
		return ""
	end
	return gen_block("", branch_name, "%#St_cwd_sep#", "%#St_cwd_bg#", "%#St_cwd_txt#")
end

local git_file_st = function()
	return "%#St_gitIcons#" .. git()[2]
end

-- Custom the cursor position like vs code
local override_cursor = function()
	return gen_block("", "L:%l | C:%c", "%#St_Pos_sep#", "%#St_Pos_bg#", "%#St_Pos_txt#")
end

-- config for minimal
local st_line = {
	theme = "minimal",
	separator_style = "round",
	order = { "mode", "gtbr", "git", "%=", "lsp_msg", "%=", "diagnostics", "lsp", "cursor", "file" },
	modules = {
		cursor = override_cursor,
		gtbr = git_branch,
		git = git_file_st,
	},
}

return st_line
