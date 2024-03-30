-- Change default shell to powershell 7.
vim.opt.shell = vim.fn.executable("pwsh") and "pwsh" or "powershell"
vim.opt.shellcmdflag =
	"-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;"
vim.opt.shellredir = "-RedirectStandardOutput %s -NoNewWindow -Wait"
vim.opt.shellpipe = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode"
vim.opt.shellquote = ""
vim.opt.shellxquote = ""

-- Add hightlight for mdx. It must be added before lsp server plugins,
-- otherwide it will override every file to be mdx

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
	pattern = { "*.mdx" },
	callback = function()
		-- First option
		-- local buf = vim.api.nvim_get_current_buf()
		-- vim.api.nvim_buf_set_option(buf, "filetype", "markdown")
		--
		-- Second option
		vim.treesitter.start(buf, "markdown")
	end,
})

-- NvChad config
vim.g.base46_cache = vim.fn.stdpath("data") .. "/nvchad/base46/"
vim.g.mapleader = " "

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
	local repo = "https://github.com/folke/lazy.nvim.git"
	vim.fn.system({ "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath })
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require("configs.lazy")
-- load plugins
require("lazy").setup({
	{
		"NvChad/NvChad",
		lazy = false,
		branch = "v2.5",
		import = "nvchad.plugins",
		config = function()
			require("options")
		end,
	},

	{ import = "plugins" },
}, lazy_config)

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require("nvchad.autocmds")

-- Only show opened buffer
-- vim.api.nvim_create_autocmd({ "BufAdd", "BufEnter", "tabnew" }, {
-- 	callback = function()
-- 		vim.t.bufs = vim.tbl_filter(function(bufnr)
-- 			return vim.api.nvim_buf_get_option(bufnr, "modified")
-- 		end, vim.t.bufs)
-- 	end,
-- })
vim.api.nvim_create_autocmd({ "BufAdd", "BufEnter", "tabnew" }, {
	callback = function()
		vim.t.bufs = {}
	end,
})

-- Enable cursorline becase it is disabled by default
-- vim.opt.cursorlineopt = "both"

vim.schedule(function()
	require("mappings")
end)
