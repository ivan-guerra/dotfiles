local keymap = vim.api.nvim_set_keymap
local default_opts = { noremap = true, silent = true }

-- Fast escape and Ex mode shortcuts.
keymap("i", "jj", "<ESC>", default_opts)
keymap("n", "kk", ":", default_opts)

-- Toggle a code outline.
keymap("n", "<C-b>", ":SymbolsOutline<CR>", default_opts)

-- Set the nterm shell to fish.
vim.o.shell = "fish"

-- See https://github.com/jose-elias-alvarez/null-ls.nvim/issues/428
local notify = vim.notify
vim.notify = function(msg, ...)
    if msg:match("warning: multiple different client offset_encodings") then
        return
    end

    notify(msg, ...)
end
