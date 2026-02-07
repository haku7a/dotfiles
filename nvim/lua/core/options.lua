-- Show line numbers
vim.o.number = true

-- Relative line numbers
vim.o.relativenumber = true

-- Enable mouse support
vim.o.mouse = "a"

-- Show current mode
vim.o.showmode = true

-- Sync clipboard between OS and Neovim
vim.schedule(function()
	vim.o.clipboard = "unnamedplus"
end)
