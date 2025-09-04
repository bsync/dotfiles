require "nvchad.autocmds"
--
-- Set Python-specific keymaps for Python buffers
vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
	group = python_group,
	pattern = "*.py",
	callback = function(event)
		-- Only set the keymap if it doesn't already exist
		vim.keymap.set("n", "<leader>db", "obreakpoint()<Esc>", {
			desc = "Set breakpoint",
			buffer = true, -- Make the mapping local to this buffer
		})
		vim.keymap.set("n", "<leader>bp", "obreakpoint()<Esc>", {
			desc = "Set breakpoint",
			buffer = true, -- Make the mapping local to this buffer
		})
	end,
})
