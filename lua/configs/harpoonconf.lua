local harpoon = require("harpoon")

local hp_conf = {}

-- REQUIRED
harpoon:setup(hp_conf)
-- REQUIRED

vim.keymap.set("n", "<leader>E", function()
	harpoon.ui:toggle_quick_menu(harpoon:list())
end, { desc = "Open harpoon window" })

vim.keymap.set("n", "<leader>a", function()
	harpoon:list():append()
end, { desc = "Add buffer to Harpoon list" })

vim.keymap.set("n", "<leader>X", function()
	harpoon:list():remove()
end, { desc = "Remove buffer from Harpoon list" })

vim.keymap.set("n", "<C-h>", function()
	harpoon:list():select(1)
end)
vim.keymap.set("n", "<C-t>", function()
	harpoon:list():select(2)
end)
vim.keymap.set("n", "<C-n>", function()
	harpoon:list():select(3)
end)
vim.keymap.set("n", "<C-s>", function()
	harpoon:list():select(4)
end)

-- Toggle previous & next buffers stored within Harpoon list
vim.keymap.set("n", "<Tab>", function()
	harpoon:list():prev()
end)
vim.keymap.set("n", "<S-Tab>", function()
	harpoon:list():next()
end)

return harpoon
