require("nvchad.mappings")

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })

-- map("n", "<leader>fm", function()
--   require("conform").format()
-- end, { desc = "File Format with conform" })

map("i", "jk", "<ESC>", { desc = "Escape insert mode" })

map({ "n", "v" }, "<leader>gc", "<cmd>lua require('telescope.builtin').git_commits()<CR>", {
	desc = "Telescope Git commits",
})

-- Have to bring the keymap for neogit to here so that it can be triggered by command
map({ "n", "v" }, "<leader>gn", "<cmd>lua require('neogit').open()<cr>", {
	desc = "Neogit Git dashboard",
})

-- Have to do this for grapple to override tabufline keymap
map(
	"n",
	"<Tab>",
	"<cmd> \z
      lua	local grapple = require('grapple'); \z	
      grapple.cycle_forward(); \z
			grapple.toggle(); grapple.toggle(); \z
      <cr>",
	{ desc = "Grapple go to next tag" }
)

map(
	"n",
	"<S-Tab>",
	"<cmd> \z
      lua	local grapple = require('grapple'); \z	
      grapple.cycle_backward(); \z
			grapple.toggle(); grapple.toggle(); \z
      <cr>",
	{ desc = "Grapple cycle to the last visit tag" }
)
