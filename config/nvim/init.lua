-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

vim.api.nvim_create_autocmd("ColorScheme", {
	callback = function()
		-- You can inspect existing highlights using :hi under the colorscheme
		vim.api.nvim_set_hl(0, "CursorLine", { bg = "#1a3a5a", bold = true })
		vim.api.nvim_set_hl(0, "CursorColumn", { bg = "#1a3a5a", bold = true })
	end,
})
vim.cmd.colorscheme("tokyonight-moon")

local snacks_loaded, snacks = pcall(require, "snacks")
if snacks_loaded then
	snacks.dim(true)
end

vim.keymap.set("t", "<Esc><Esc>", [[<C-\><C-n>]], { noremap = true })
vim.keymap.set("n", "<leader>;", ":Telescope buffers<CR>", { desc = "List buffers" })
vim.keymap.set("n", "<leader>fw", ":Telescope grep_string<CR>", { desc = "Find word (under cursor)" })

-- vim.g.autoformat = false
