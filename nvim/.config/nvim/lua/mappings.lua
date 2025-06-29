require("nvchad.mappings")

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("n", "<leader>f", vim.diagnostic.open_float)

-- Run a just recipe asynchronously.
map("n", "<leader>cb", ":Just ", { silent = false })

-- Quickfix display and navigation.
local default_opts = { noremap = true, silent = true }
map("n", "<leader>cq", ":Copen<CR>", default_opts)
map("n", "<leader>j", ":cn<CR>", default_opts)
map("n", "<leader>k", ":cp<CR>", default_opts)

-- Run formatter on command.
map({ "n", "v" }, "<leader>mp", function()
	local conform = require("conform")
	conform.format({
		lsp_fallback = true,
		async = false,
		timeout_ms = 500,
	})
end, { desc = "format file or range (in visual mode)" })

-- Toggle Copilot chat.
map("n", "<leader>aa", ":CopilotChatToggle<CR>", default_opts)

-- Copilot quick chat.
map("n", "<leader>ccq", function()
	local input = vim.fn.input("Quick Chat: ")
	if input ~= "" then
		require("CopilotChat").ask(input, { selection = require("CopilotChat.select").buffer })
	end
end, { desc = "copilot quick chat" })

-- Upgrade all crates in Cargo.toml.
map("n", "<leader>rcu", function()
	require("crates").upgrade_all_crates()
end, { desc = "upgrade all crates" })

-- Gitsigns navigation.
map("n", "]c", ":Gitsigns next_hunk<CR>", { desc = "next git hunk" })
map("n", "[c", ":Gitsigns prev_hunk<CR>", { desc = "prev git hunk" })
map("n", "<leader>ph", ":Gitsigns preview_hunk<CR>", { desc = "preview hunk" })
map("n", "<leader>rh", ":Gitsigns reset_hunk<CR>", { desc = "reset hunk" })
map("n", "<leader>rb", ":Gitsigns reset_buffer<CR>", { desc = "reset buffer" })

-- Toggle code outlining.
map("n", "<leader>o", ":Outline<CR>", { desc = "toggle code outline" })
