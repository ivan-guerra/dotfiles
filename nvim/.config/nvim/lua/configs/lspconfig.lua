require("nvchad.configs.lspconfig").defaults()

-- Required so that clangd can locate system headers.
vim.lsp.config.clangd = {
	cmd = {
		"clangd",
		"--background-index",
		"--query-driver=**", -- Let clangd find your clang installation
	},
	capabilities = require("nvchad.configs.lspconfig").capabilities,
	on_attach = require("nvchad.configs.lspconfig").on_attach,
}

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
