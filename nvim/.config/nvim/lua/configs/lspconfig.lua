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

vim.lsp.enable(servers)
