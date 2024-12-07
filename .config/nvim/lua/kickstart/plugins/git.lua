return {
	{
		"kdheepak/lazygit.nvim",
		lazy = true,
		cmd = {
			"LazyGit",
			"LazyGitConfig",
			"LazyGitCurrentFile",
			"LazyGitFilter",
			"LazyGitFilterCurrentFile",
		},
		-- optional for floating window border decoration
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		-- setting the keybinding for LazyGit with 'keys' is recommended in
		-- order to load the plugin when the command is run for the first time
		keys = { { "<leader>gg", "<cmd>LazyGit<cr>", desc = "LazyGit" } },
	},
	{
		"NeogitOrg/neogit",
		lazy = true,
		dependencies = {
			"nvim-lua/plenary.nvim", -- required
			"sindrets/diffview.nvim", -- optional - Diff integration

			-- Only one of these is needed.
			"nvim-telescope/telescope.nvim", -- optional
			--"ibhagwan/fzf-lua", -- optional
			--"echasnovski/mini.pick", -- optional
		},
		keys = { { "<leader>gn", "<cmd>Neogit kind=vsplit<cr>", desc = "NeoGit" } },
		config = true,
		cmd = "Neogit",
	},
	"sindrets/diffview.nvim", -- optional - Diff integration
}
