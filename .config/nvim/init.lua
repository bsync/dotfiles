--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ";"
vim.g.maplocalleader = ";"
vim.diagnostic.config({ virtual_text = true })
vim.g.have_nerd_font = true

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

-- Window navigation
vim.keymap.set("n", "<C-h>", "<C-w>h", { noremap = true, silent = true })
vim.keymap.set("n", "<C-j>", "<C-w>j", { noremap = true, silent = true })
vim.keymap.set("n", "<C-k>", "<C-w>k", { noremap = true, silent = true })
vim.keymap.set("n", "<C-l>", "<C-w>l", { noremap = true, silent = true })

function _G.toggle_diagnostics()
	if vim.diagnostic.is_enabled() then
		vim.diagnostic.enable(false)
		vim.notify("Diagnostics disabled for current buffer", vim.log.levels.INFO)
	else
		vim.diagnostic.enable()
		vim.notify("Diagnostics enabled for current buffer", vim.log.levels.INFO)
	end
end

vim.keymap.set(
	"n",
	"<leader>td",
	"<cmd>lua _G.toggle_diagnostics()<CR>",
	{ noremap = true, silent = true, desc = "Toggle diagnostics for current buffer" }
)
--
-- vim: ts=2 sts=2 sw=2 et
