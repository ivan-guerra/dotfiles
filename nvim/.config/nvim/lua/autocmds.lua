-- Wrap lines in markdown files at 80 chars.
vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function()
    vim.opt_local.textwidth = 80
  end,
})

-- Control when linting is triggered.
local lint = require "lint"
local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
  group = lint_augroup,
  callback = function()
    lint.try_lint()
  end,
})

-- Auto-close terminal when process exits.
vim.api.nvim_create_autocmd("TermClose", {
  pattern = "term://*",
  callback = function()
    vim.api.nvim_win_close(0, true)
  end,
})

-- Use vim-dispatch to run just recipes asynchronously.
vim.cmd [[
  function! DispatchJust(...)
    let l:args = join(a:000, ' ')
    execute 'Dispatch just ' . l:args
  endfunction

  command! -nargs=* Just call DispatchJust(<f-args>)
]]
