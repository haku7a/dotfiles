local map = vim.keymap.set

-- Clear search highlights with <Esc>
map("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Diagnostic keymaps
map("n", "<leader>q", vim.diagnostic.setloclist, { silent = true, desc = "Open diagnostic [Q]uickfix list" })

-- Exit terminal mode
map("t", "<Esc><Esc>", "<C-\\><C-n>", { silent = true, desc = "Exit terminal mode" })
