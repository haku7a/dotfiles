local map = vim.keymap.set

map("n", "<Leader>w", ":w<CR>", { desc = "Save file" })
map("n", "<Tab>", ":bnext<CR>", { silent = true, desc = "Next buffer" })
map("n", "<S-Tab>", ":bprevious<CR>", { silent = true, desc = "Previous buffer" })
map("n", "<Leader>x", ":bdelete<CR>", { silent = true, desc = "Close current buffer" })

-- Telescope
map("n", "<leader>ff", function() require("telescope.builtin").find_files() end, { desc = "Find files" })

-- Neo-tree
map("n", "<leader>e", ":Neotree toggle<CR>", { silent = true, desc = "Toggle Neo-tree" })
