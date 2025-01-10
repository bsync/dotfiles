vim.keymap.set("n", "<leader>bp", "obreakpoint()<ESC>", { desc = "Set a pythonic breakpoint", buffer = true })
vim.keymap.set(
	"n",
	"<leader>bP",
	"oimport sys; sys.stdin=open(0); breakpoint()<ESC>",
	{ desc = "Set a pythonic breakpoint with stdin", buffer = true }
)
