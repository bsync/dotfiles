return {
  {
		"echasnovski/mini.surround",
    opts={},
  },
  {
		"echasnovski/mini.files",
		config = function()
			local MiniFiles = require("mini.files")
			MiniFiles.setup({
				mappings = {
					go_in = "<CR>",
					go_in_plus = "<CR>",
					go_out = "-",
					gout_out_plus = "H",
				},
				options = {
					use_as_default_explorer = true,
				},
				windows = {
					preview = false,
				},
			})

			-- Create an autocmd to handle directory opening
			vim.api.nvim_create_autocmd("BufEnter", {
				pattern = "*",
				callback = function(args)
					-- Get the current buffer's path
					local path = vim.fn.expand("%:p")
					-- Check if it's a directory
					if vim.fn.isdirectory(path) == 1 then
						-- Close the current buffer
						vim.api.nvim_buf_delete(args.buf, { force = true })
						-- Open mini.files at the directory path
						MiniFiles.open(path)
						-- Return true to indicate we've handled the event
						return true
					end
				end,
			})
		end,
	}
}
