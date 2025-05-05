--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ";"
vim.g.maplocalleader = ";"
vim.diagnostic.config({ virtual_text = true })
vim.g.have_nerd_font = true
vim.opt.cursorcolumn = true

require("options")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({ { import = "plugins" }, { import = "plugins.lsp" } }, {
	install = {
		colorscheme = { "nightfly" },
	},
	checker = {
		enabled = true,
		notify = false,
	},
	change_detection = {
		notify = false,
	},
})

-- [[ Basic Keymaps ]]
-- Buffer navigation
vim.keymap.set("n", "<C-p>", ":bprevious<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-n>", ":bnext<CR>", { noremap = true, silent = true })
