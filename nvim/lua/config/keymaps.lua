local map = vim.keymap.set

map("n", "<Leader>w", ":w<CR>", { desc = "Save file" })
map("n", "<Tab>", ":bnext<CR>", { silent = true, desc = "Next buffer" })
map("n", "<S-Tab>", ":bprevious<CR>", { silent = true, desc = "Previous buffer" })
map("n", "<Leader>x", ":bdelete<CR>", { silent = true, desc = "Close current buffer" })

