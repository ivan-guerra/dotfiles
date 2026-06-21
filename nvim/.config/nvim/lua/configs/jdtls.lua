local jdtls = require("jdtls")

local function start()
	local root_dir = vim.fs.root(0, { "pom.xml", "build.gradle", "build.gradle.kts", "mvnw", "gradlew", ".git" })
	local project_name = vim.fn.fnamemodify(root_dir or vim.fn.getcwd(), ":t")
	local workspace_dir = vim.fn.stdpath("data") .. "/jdtls/" .. project_name

	jdtls.start_or_attach({
		cmd = { "jdtls", "-data", workspace_dir },
		root_dir = root_dir,
		capabilities = require("nvchad.configs.lspconfig").capabilities,
		on_attach = function(client, bufnr)
			require("nvchad.configs.lspconfig").on_attach(client, bufnr)
			vim.api.nvim_create_autocmd("BufWritePre", {
				buffer = bufnr,
				callback = function()
					jdtls.organize_imports()
				end,
			})
		end,
		settings = {
			java = {
				eclipse = { downloadSources = true },
				maven = { downloadSources = true },
				configuration = { updateBuildConfiguration = "interactive" },
				implementationsCodeLens = { enabled = true },
				referencesCodeLens = { enabled = true },
				sources = {
					organizeImports = { starThreshold = 9999, staticStarThreshold = 9999 },
				},
			},
		},
		init_options = { bundles = {} },
	})
end

vim.api.nvim_create_autocmd("FileType", {
	pattern = "java",
	callback = start,
})

-- Handle the buffer that triggered the plugin load
if vim.bo.filetype == "java" then
	start()
end
