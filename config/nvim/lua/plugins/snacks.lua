return {
	"folke/snacks.nvim",
	lazy = false,
	keys = {
		{
			"<leader>lg",
			function()
				Snacks.lazygit()
			end,
			desc = "lazygit",
		},
	},
}
