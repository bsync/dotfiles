return {
	"frankroeder/parrot.nvim",
	dependencies = { "ibhagwan/fzf-lua", "nvim-lua/plenary.nvim" },
	-- optionally include "folke/noice.nvim" or "rcarriga/nvim-notify" for beautiful notifications
	config = function()
		require("parrot").setup({
			-- Providers must be explicitly added to make them available.
			providers = {
				anthropic = {
					api_key = { "gopass", "show", "-o", "api/anthropic/key" },
				},
			},
		})
	end,
}
