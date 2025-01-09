local keymap = vim.api.nvim_set_keymap
local default_opts = { noremap = true, silent = true }

-- Run a just recipe asynchronously.
keymap("n", "<leader>cb", ":Just ", {silent = false})

-- Quickfix display and navigation.
keymap("n", "<leader>cq", ":Copen<CR>", default_opts)
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

-- Use vim-dispatch to run just recipes asynchronously.
vim.cmd([[
  function! DispatchJust(...)
    let l:args = join(a:000, ' ')
    execute 'Dispatch just ' . l:args
  endfunction

  command! -nargs=* Just call DispatchJust(<f-args>)
]])

-- See https://github.com/jose-elias-alvarez/null-ls.nvim/issues/428
local notify = vim.notify
vim.notify = function(msg, ...)
    if msg:match("warning: multiple different client offset_encodings") then
        return
    end

    notify(msg, ...)
end
