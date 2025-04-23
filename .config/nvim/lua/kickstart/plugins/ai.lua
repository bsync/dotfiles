return {
	"olimorris/codecompanion.nvim",
	config = true,
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
	opts = {
		strategies = {
			-- Change the default chat adapter
			chat = {
				adapter = "anthropic",
			},
			inline = {
				adapter = "anthropic",
			},
		},
		adapters = {
			anthropic = function()
				return require("codecompanion.adapters").extend("anthropic", {
					env = {
						api_key = "cmd:gopass api/anthropic/key",
					},
				})
			end,
		},
	},
	keys = {
		{
			"<C-a>",
			"<cmd>CodeCompanionActions<cr>",
			mode = { "n", "v" },
			desc = "Code Companion Actions",
			noremap = true,
			silent = true,
		},
		{
			"<LocalLeader>a",
			"<cmd>CodeCompanionChat Toggle<cr>",
			mode = { "n", "v" },
			desc = "Toggle Code Companion Chat",
			noremap = true,
			silent = true,
		},
		{
			"ga",
			"<cmd>CodeCompanionChat Add<cr>",
			mode = "v",
			desc = "Add to Code Companion Chat",
			noremap = true,
			silent = true,
		},
	},
	init = function() -- Using init to execute it right away
		vim.cmd([[cab cc CodeCompanion]])
	end,
}
