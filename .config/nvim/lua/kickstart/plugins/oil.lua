-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
	"stevearc/oil.nvim",
	-- setting cmd/keys will cause Lazy.nvim to only load Oil when on that cmd or key press
	cmd = "Oil",
	keys = {
		{
			"<Bslash><Bslash>", -- or whatever key you want to trigger oil
			function()
				require("oil").toggle_float()
			end, -- or however you want it to be displayed
			desc = "Oil",
		},
	},
	-- opts = {}, -- setting opts doesn't do anything if you're using a custom config function so this line can be removed
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("oil").setup({
			default_file_explorer = true,
			delete_to_trash = true,
			skip_confirm_for_simple_edits = false,
			view_options = {
				show_hidden = false,
				natural_order = true,
				is_always_hidden = function(name, _)
					return name == ".." or name == ".git"
				end,
			},
			win_options = {
				wrap = true,
			},
		})
	end,
}
