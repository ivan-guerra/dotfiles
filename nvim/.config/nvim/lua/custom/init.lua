local keymap = vim.api.nvim_set_keymap
local default_opts = { noremap = true, silent = true }

-- Toggle a code outline.
keymap("n", "<C-b>", ":SymbolsOutline<CR>", default_opts)

-- Enter a make command.
keymap("n", "<leader>cb", ":make ", {silent = false})

-- Quickfix display and navigation.
keymap("n", "<leader>cq", ":cope<CR>", default_opts)
keymap("n", "<leader>j", ":cn<CR>", default_opts)
keymap("n", "<leader>k", ":cp<CR>", default_opts)

-- Set the nterm shell to fish.
vim.o.shell = "fish"

-- Set textwidth=80 when editing markdown files.
vim.cmd([[ 
  augroup auFileTypes
    autocmd!
    autocmd FileType markdown setlocal textwidth=80
  augroup end
]])

-- See https://github.com/jose-elias-alvarez/null-ls.nvim/issues/428
local notify = vim.notify
vim.notify = function(msg, ...)
    if msg:match("warning: multiple different client offset_encodings") then
        return
    end

    notify(msg, ...)
end
