local map = vim.keymap.set

-- Clear search highlights with <Esc>
map("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Diagnostic keymaps
map("n", "<leader>q", vim.diagnostic.setloclist, { silent = true, desc = "Open diagnostic [Q]uickfix list" })

-- Exit terminal mode
map("t", "<Esc><Esc>", "<C-\\><C-n>", { silent = true, desc = "Exit terminal mode" })

-- Better window navigation
map("n", "<C-h>", "<C-w>h", { silent = true, desc = "Move focus to the left window" })
map("n", "<C-l>", "<C-w>l", { silent = true, desc = "Move focus to the right window" })
map("n", "<C-j>", "<C-w>j", { silent = true, desc = "Move focus to the lower window" })
map("n", "<C-k>", "<C-w>k", { silent = true, desc = "Move focus to the upper window" })
