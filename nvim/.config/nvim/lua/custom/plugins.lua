local plugins = {
  {
    "simrat39/symbols-outline.nvim",
    cmd = "SymbolsOutline",
    keys = {
      {
        "<leader>cs", "<cmd>SymbolsOutline<cr>", desc = "Symbols Outline"
      }
    },
    config = true,
  },
  {
    "jackMort/ChatGPT.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim"
    },
    config = function ()
      require("chatgpt").setup({
        api_key_cmd = "pass show services/programming/openai.apikey",
        openai_param = {
          model = "gpt-4o-mini"
        }
      })
    end,
  },
  {
    "tpope/vim-dispatch",
    lazy = false,
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    event = "VeryLazy",
    opts = function()
      return require("custom.configs.null-ls")
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
      require("lspconfig").lua_ls.setup({
        settings = {
          Lua = {
            diagnostics = {
              globals = {"vim"}
            }
          }
        }
      })
    end,
  },
  {
    "rust-lang/rust.vim",
    ft= "rust",
    init = function ()
      vim.g.rustfmt_autosave = 1
    end
  },
  {
    "mrcjkb/rustaceanvim",
    version = "^4",
    ft = { "rust" },
    dependencies = "neovim/nvim-lspconfig",
    config = function()
      require "custom.configs.rustaceanvim"
    end
  },
  {
    "mfussenegger/nvim-dap"
  },
  {
    "saecki/crates.nvim",
    ft = {"rust", "toml"},
    config = function(_, opts)
      local crates = require("crates")
      crates.setup(opts)
      crates.show()
    end
  },
  {
    "hrsh7th/nvim-cmp",
    opts = function()
      local M = require("plugins.configs.cmp")
      table.insert(M.sources, {name = "crates"})
      return M
    end
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "autopep8",
        "bash-language-server",
        "beautysh",
        "clang-format",
        "clangd",
        "cmake-language-server",
        "cmakelang",
        "cpplint",
        "dockerfile-language-server",
        "flake8",
        "jedi-language-server",
        "latexindent",
        "lua-language-server",
        "marksman",
        "rust-analyzer",
        "shellcheck",
        "texlab",
        "vale"
      }
    }
  }
}
return plugins
