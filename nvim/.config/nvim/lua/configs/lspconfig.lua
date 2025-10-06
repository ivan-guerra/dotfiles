require("nvchad.configs.lspconfig").defaults()

local servers = {
	"bashls",
	"clangd",
	"cmake",
	"dockerls",
	"jsonls",
	"lua_ls",
	"marksman",
	"pyright",
	"superhtml",
	"texlab",
}
local nvlsp = require("nvchad.configs.lspconfig")

for _, lsp in ipairs(servers) do
	vim.lsp.config[lsp] = {
		on_attach = nvlsp.on_attach,
		on_init = nvlsp.on_init,
		capabilities = nvlsp.capabilities,
	}
	vim.lsp.enable(lsp)
end
