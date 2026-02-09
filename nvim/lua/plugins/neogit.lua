-- Neogit is a Magit clone for Neovim that provides an intuitive interface for Git operations.
return {
	"NeogitOrg/neogit",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"sindrets/diffview.nvim",
		"nvim-telescope/telescope.nvim",
	},
	config = true,
	keys = {
		{ "<leader>gg", "<cmd>Neogit<cr>", desc = "Neogit status" },
	},
}
