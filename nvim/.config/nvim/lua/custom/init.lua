local keymap = vim.api.nvim_set_keymap
local default_opts = { noremap = true, silent = true }

-- Fast escape and Ex mode shortcuts.
keymap("i", "jj", "<ESC>", default_opts)
keymap("n", "kk", ":", default_opts)

-- Toggle a code outline.
keymap("n", "<C-b>", ":SymbolsOutline<CR>", default_opts)

-- Set the nterm shell to fish.
vim.o.shell = "fish"
