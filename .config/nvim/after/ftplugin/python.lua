local telescope = require("telescope.builtin")

vim.keymap.set("n", "<leader>bp", "obreakpoint()<ESC>", { desc = "Set a pythonic breakpoint", buffer = true })

vim.keymap.set(
	"n",
	"<leader>bP",
	"oimport sys; sys.stdin=open(0); breakpoint()<ESC>",
	{ desc = "Set a pythonic breakpoint with stdin", buffer = true }
)

vim.keymap.set("n", "<leader>bp", "obreakpoint()<ESC>", { desc = "Set a pythonic breakpoint", buffer = true })

vim.keymap.set("n", "<leader>sb", function()
	telescope.live_grep({ default_text = "breakpoint()" })
end, { desc = "Find breakpoint()s", buffer = true })
