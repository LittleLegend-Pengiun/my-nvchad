local configs = require("nvchad.configs.lspconfig")

local lsp_on_attach = configs.on_attach

-- Load custom on_attach function in order to run barbecue properly
local bbc_on_attach = require("configs.barbecueconf").on_attach

-- Pass all the needed on_attach function to here
local on_attach = function(client, buffr)
	lsp_on_attach(client, buffr)
	bbc_on_attach(client, buffr)
end
local on_init = configs.on_init
local capabilities = configs.capabilities

local lspconfig = require("lspconfig")
local util = require("lspconfig/util")

local servers = { "html", "cssls" }

for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup({
		on_init = on_init,
		on_attach = on_attach,
		capabilities = capabilities,
	})
end

-- Without the loop, you would have to manually set up each LSP
--
-- lspconfig.html.setup {
--   on_attach = on_attach,
--   capabilities = capabilities,
-- }
--
-- lspconfig.cssls.setup {
--   on_attach = on_attach,
--   capabilities = capabilities,
-- }

-- Config for golang
lspconfig.gopls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	cmd = { "gopls" },
	filename = { "go", "gomod", "gowork", "gotmpl" },
	root_dir = util.root_pattern("go.work", "go.mod", ".git"),
	settings = {
		gopls = {
			completeUnimported = true,
			usePlaceholders = true,
			analyses = {
				unusedparam = true,
			},
			staticcheck = true,
			gofumpt = true,
		},
	},
})

-- Config for typescript
lspconfig.tsserver.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	init_options = {
		preferences = {
			disableSuggestions = true,
		},
	},
})
