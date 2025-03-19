local plugins = {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    lazy = false,
    branch = "main",
    dependencies = {
      { "github/copilot.vim" },
      { "nvim-lua/plenary.nvim" },
    },
    opts = {
      debug = false,
      model = "claude-3.5-sonnet",
      window = {
        layout = "vertical",
        relative = "cursor"
      }
    },
    suggestions = {
      enabled = true,
      auto_trigger = true,
      hide_during_complete = true,
      debounce = 75,
      keymap = {
        accept = "<M-l>",
        accept_word = true,
        accept_line = true,
        next = "<M-]>",
        prev = "<M-[>",
        dismiss = "<C-]>",
      }
    },
    keys = {
      {
       "<leader>ccq",
          function()
            local input = vim.fn.input("Quick Chat: ")
            if input ~= "" then
              require("CopilotChat").ask(input, { selection = require("CopilotChat.select").buffer })
            end
          end,
          desc = "CopilotChat - Quick chat",
      }
    }
  },
  {
    "github/copilot.vim",
    event = "VeryLazy",
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
    "jose-elias-alvarez/null-ls.nvim",
    event = "VeryLazy",
    opts = function()
      return require("custom.configs.null-ls")
    end,
  },
  {
    "mfussenegger/nvim-dap"
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
    "rcarriga/nvim-notify",
    config = function ()
      require("notify").setup({
        stages = "fade_in_slide_out",
        background_color = "FloatShadow",
        timeout = 3000,
      })
      vim.notify = require("notify")
     end
  },
  {
    "rust-lang/rust.vim",
    ft= "rust",
    init = function ()
      vim.g.rustfmt_autosave = 1
    end
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
    "tpope/vim-dispatch",
    lazy = false,
  },
  {
    "radenling/vim-dispatch-neovim",
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
