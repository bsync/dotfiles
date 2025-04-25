-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
	"stevearc/oil.nvim",
	-- setting cmd/keys will cause Lazy.nvim to only load Oil when on that cmd or key press
	cmd = "Oil",
	opts = {
		default_file_explorer = true,
		delete_to_trash = true,
		skip_confirm_for_simple_edits = false,
		view_options = {
			show_hidden = true,
			natural_order = true,
		},
		win_options = {
			wrap = true,
		},
	},
	keys = {
		{
			"-", -- or whatever key you want to trigger oil
			function()
				require("oil").toggle_float()
			end, -- or however you want it to be displayed
			desc = "Oil",
		},
	},
	dependencies = { "nvim-tree/nvim-web-devicons" },
}
