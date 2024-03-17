local M = {}

M.ui = {
  theme = "chadracula",
  tabufline = {
    --  more opts
    order = { "treeOffset", "buffers", "tabs", "btns" },
  },
  statusline = {
    theme = "minimal",
    separator_style = "round",
    overriden_module = nil,
  },
  nvdash = {
    load_on_startup = true,
  },
}

return M
