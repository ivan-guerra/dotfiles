local plugins = {
  {
    "simrat39/symbols-outline.nvim",
    cmd = "SymbolsOutline",
    keys = { { "<leader>cs", "<cmd>SymbolsOutline<cr>", desc = "Symbols Outline" } },
    config = true,
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    event = "VeryLazy",
    opts = function()
      return require "custom.configs.null-ls"
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
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
        "texlab",
      }
    }
  }
}
return plugins
