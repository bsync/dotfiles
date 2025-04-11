return {
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup()
		end,
		event = "BufRead",
		keys = {
			{ "<leader>gd", "<cmd>Gitsigns preview_hunk<CR>", desc = "Show changes to current hunk" },
			{ "<leader>gr", "<cmd>Gitsigns reset_hunk<CR>", desc = "Reset changes to current hunk" },
			{ "<leader>gp", "<cmd>Gitsigns prev_hunk<CR>", desc = "Navigate to previous hunk" },
			{ "<leader>gn", "<cmd>Gitsigns next_hunk<CR>", desc = "Navigate to next hunk" },
		},
	},
	{
		"sindrets/diffview.nvim", -- optional - Diff integration
	},
	{
		"tpope/vim-fugitive",
	},
}
