return {
	{
		"stevearc/conform.nvim",
		event = "BufWritePre",
		opts = require("configs.conform"),
	},

	{
		"hedyhli/outline.nvim",
		lazy = true,
		cmd = { "Outline", "OutlineToggle" },
		config = function()
			require("outline").setup({})
		end,
	},

	{
		"CopilotC-Nvim/CopilotChat.nvim",
		lazy = false,
		branch = "main",
		dependencies = {
			{ "github/copilot.vim" },
			{ "nvim-lua/plenary.nvim" },
		},
		opts = require("configs.copilotchat"),
	},

	{
		"radenling/vim-dispatch-neovim",
		dependencies = "tpope/vim-dispatch",
		lazy = false,
	},

	{
		"rust-lang/rust.vim",
		ft = "rust",
		init = function()
			vim.g.rustfmt_autosave = 1
		end,
	},

	{
		"mrcjkb/rustaceanvim",
		version = "^5",
		lazy = false,
		ft = { "rust" },
		dependencies = "neovim/nvim-lspconfig",
		config = function()
			require("configs.rustaceanvim")
		end,
	},

	{
		"saecki/crates.nvim",
		ft = { "rust", "toml" },
		config = function(_, opts)
			local crates = require("crates")
			crates.setup(opts)
			crates.show()
		end,
	},

	{
		"mfussenegger/nvim-lint",
		event = {
			"BufReadPre",
			"BufNewFile",
		},
		config = function()
			require("configs.nvim-lint")
		end,
	},

	{
		"neovim/nvim-lspconfig",
		config = function()
			require("configs.lspconfig")
		end,
	},

	{
		"williamboman/mason.nvim",
		opts = {
			ensure_installed = {
				-- language servers
				"bash-language-server",
				"clangd",
				"cmake-language-server",
				"dockerfile-language-server",
				"json-lsp",
				"lua-language-server",
				"marksman",
				"pyright",
				"superhtml",
				"texlab",
				-- linters
				"cmakelang",
				"cmakelint",
				"cpplint",
				"flake8",
				"hadolint",
				"htmlhint",
				"jsonlint",
				"shellcheck",
				"stylelint",
				"vale",
				-- formatters
				"autopep8",
				"beautysh",
				"clang-format",
				"prettier",
				"prettierd",
			},
		},
	},

	{
		"nvim-treesitter/nvim-treesitter",
		opts = {
			ensure_installed = {
				"vim",
				"lua",
				"vimdoc",
				"html",
				"css",
				"rust",
				"cpp",
				"python",
				"bash",
				"markdown",
				"dockerfile",
				"cmake",
				"devicetree",
				"doxygen",
				"gitcommit",
				"gitattributes",
				"gitignore",
				"git_rebase",
				"git_config",
				"json",
				"kconfig",
				"just",
				"muttrc",
				"superhtml",
				"tmux",
				"xml",
				"yaml",
				"toml",
				"rst",
				"make",
				"fish",
				"diff",
			},
		},
	},
}
