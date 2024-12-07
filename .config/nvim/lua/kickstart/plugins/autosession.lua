return {
	"rmagatti/auto-session",
	config = function()
		require("auto-session").setup({
			auto_restore = true,
			suppressed_dirs = { "~/", "/" },
		})
	end,
}
