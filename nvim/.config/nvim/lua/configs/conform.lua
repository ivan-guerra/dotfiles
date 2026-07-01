local options = {
	formatters_by_ft = {
		lua = { "stylua" },
		css = { "prettier" },
		html = { "prettier" },
		java = { "google-java-format" },
		json = { "prettier" },
		yaml = { "prettier" },
		markdown = { "prettier" },
		c = { "clang-format" },
		cpp = { "clang-format" },
		sh = { "beautysh" },
		bash = { "beautysh" },
		cmake = { "cmake_format" },
		python = { "ruff_fix", "ruff_format", "ruff_organize_imports" },
	},
	formatters = {
		["google-java-format"] = {
			-- Append --skip-sorting-imports to prevent rearranging/sorting
			prepend_args = { "--skip-sorting-imports" },
		},
	},

	format_on_save = {
		timeout_ms = 500,
		lsp_fallback = true,
	},
}

return options
