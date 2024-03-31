local tb_line = {
	order = { "treeOffset", "cwd", "buffers", "tabs", "btns" },
	modules = {
		cwd = function()
			local name = vim.loop.cwd()
			name = name:match("([^/\\]+)[/\\]*$") or name
			return "~~~~~~~ [  " .. name .. " ]"
		end,
	},
}

return tb_line
