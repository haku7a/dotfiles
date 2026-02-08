-- Show keybindings menu
return {
	"folke/which-key.nvim",
	event = "VimEnter",
	opts = {
		delay = 0,
		icons = { mappings = vim.g.have_nerd_font },
		win = {
			width = 45,
			height = { min = 5, max = 25 },
			col = -2,
			row = 0.9,
			-- border = "rounded",
			wo = {
				winblend = 40,
			},
		},
		spec = {
			{ "<leader>s", group = "[S]earch", mode = { "n", "v" } },
			{ "<leader>t", group = "[T]oggle" },
			{ "<leader>h", group = "Git [H]unk", mode = { "n", "v" } },
		},
	},
}
