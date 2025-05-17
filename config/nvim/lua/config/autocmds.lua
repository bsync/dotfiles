-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- Disable autoformat for Python files and set Python-specific keymaps
local python_group = vim.api.nvim_create_augroup("PythonSettings", { clear = true })

-- When entering a Python buffer
vim.api.nvim_create_autocmd("FileType", {
	group = python_group,
	pattern = "python",
	callback = function(event)
		-- Disable autoformat for this buffer
		vim.b.autoformat = false
	end,
})

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
	end,
})
