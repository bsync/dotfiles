require "nvchad.mappings"

local map = vim.keymap.set
local root = function()
  return vim.fn.fnamemodify(vim.api.nvim_buf_get_name(0), ":p:h")
end

map("i", "jk", "<ESC>")
-- Terminal mode mapping: double escape to exit insert mode
map("t", "<ESC><ESC>", "<C-\\><C-n>", { desc = "Exit terminal mode with double ESC" })

local wk = require("which-key")

wk.add({ "<leader>;", function() require("telescope.builtin").buffers() end, desc="List buffers" })

-- Add AI group mappings
wk.add({
  { "<leader>a", group = "AI" },
  { "<leader>at", function() require('opencode').toggle() end, desc = 'Toggle embedded' },
  { "<leader>aa", function() require('opencode').ask('@cursor: ') end, desc = 'Ask about this', mode = "n" },
  { "<leader>aa", function() require('opencode').ask('@selection: ') end, desc = 'Ask about selection', mode = "v" },
  { "<leader>a+", function() require('opencode').prompt('@buffer', { append = true }) end, desc = 'Add buffer to prompt', mode = "n" },
  { "<leader>a+", function() require('opencode').prompt('@selection', { append = true }) end, desc = 'Add selection to prompt', mode = "v" },
  { "<leader>ae", function() require('opencode').prompt('Explain @cursor and its context') end, desc = 'Explain this code' },
  { "<leader>an", function() require('opencode').command('session_new') end, desc = 'New session' },
  { "<leader>as", function() require('opencode').select() end, desc = 'Select prompt', mode = { "n", "v" } },
})

wk.add({
  { "<S-C-u>", function() require('opencode').command('messages_half_page_up') end, desc = 'Messages half page up' },
  { "<S-C-d>", function() require('opencode').command('messages_half_page_down') end, desc = 'Messages half page down' },
})

-- Add buffer group mappings
wk.add({
  { "<leader>b", group = "Buffer" },
  { "<leader>bd", ":bdelete<CR>", desc="Delete Buffer" },
  { "<leader>bo", ":%bd|e#|bd#<CR>", desc="Delete Other Buffers" }
})

-- Add diagnostic group mappings
wk.add({
  { "<leader>d", group = "Diagnostics" },
  { "<leader>dt",
    function()
      vim.diagnostic.config(
        {virtual_text=not vim.diagnostic.config().virtual_text})
    end,
    desc="toggle diagnostics"},
})

-- Add file/telescope group mappings
wk.add({
  { "<leader>f", group = "Find" },
  { "<leader>fe", function()
        local MiniFiles = require("mini.files")
        MiniFiles.open(vim.api.nvim_buf_get_name(0), false)
				MiniFiles.reveal_cwd()
			end, desc = "Mini parent file browse" },
  { "<leader>ef", "fe<cr>", desc="Mini files browse" },
  { "<leader>fF", function() require("mini.files").open() end, desc="Mini files browse" },
  { "<leader>fc", function() require("mini.files").open("~/.config/nvim/lua") end, desc="Mini config files browse" },
  { "<leader>fd", function() require("dbee").open() end, desc="Find in database using DBee" },
  { "<leader>fr", function() require("telescope.builtin").lsp_references() end, desc="References to LSP symbol under cursor" },
  { "<leader>fw", function() require("telescope.builtin").grep_string() end, desc="String under cursor" },
  { "<leader>fg", function() require("telescope.builtin").live_grep() end, desc="LiveGrep" },
  { "<leader>fG", function() require("telescope.builtin").git_status() end, desc="Git status" },
})

-- Add GIT group mappings
wk.add({
  { "<leader>g", group= "Git" },
  { "<leader>gg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
  { "<leader>gb", "<cmd>Git blame<cr>", desc = "Git Blame" },
  { "<leader>gl", "<cmd>Gllog %<cr>", desc = "Git history log for current file" },
  { "<leader>gd", "<cmd>Gitsigns preview_hunk_inline<cr>", desc = "Preview pending git change" },
  { "<leader>gp", "<cmd>Gitsigns prev_hunk<cr>", desc = "Nav to previous git change" },
  { "<leader>gn", "<cmd>Gitsigns next_hunk<cr>", desc = "Nav to next git change" },
  { "<leader>gr", "<cmd>Gitsigns reset_hunk<cr>", desc = "git reset hunk under cursor" },
})

-- Add terminal group mappings
wk.add({
  { "<leader>t", group = "Terminal" },
  {
    "<leader>tf",
    function()
      local count = vim.v.count1
      require("toggleterm").toggle(count, 0, root(), "float")
    end,
    desc = "ToggleTerm (float root_dir)",
  },
  {
    "<leader>th",
    function()
      local count = vim.v.count1
      require("toggleterm").toggle(count, 15, root(), "horizontal")
    end,
    desc = "ToggleTerm (horizontal root_dir)",
  },
  {
    "<leader>tv",
    function()
      local count = vim.v.count1
      require("toggleterm").toggle(count, vim.o.columns * 0.4, root(), "vertical")
    end,
    desc = "ToggleTerm (vertical root_dir)",
  },
  {
    "<leader>tn",
    "<cmd>ToggleTermSetName<cr>",
    desc = "Set term name",
  },
  {
    "<leader>ts",
    "<cmd>TermSelect<cr>",
    desc = "Select term",
  },
  {
    "<leader>tt",
    function()
      require("toggleterm").toggle(1, 100, root(), "tab")
    end,
    desc = "ToggleTerm (tab root_dir)",
  },
  {
    "<leader>tT",
    function()
      require("toggleterm").toggle(1, 100, vim.loop.cwd(), "tab")
    end,
    desc = "ToggleTerm (tab cwd_dir)",
  },
})

-- Disable some nvchad mappings I don't use
vim.keymap.del('n', '<leader>gt')
vim.keymap.del('n', '<leader>x')
vim.keymap.del('n', '<leader>h')
vim.keymap.del('n', '<leader>v')
vim.keymap.del('n', '<leader>b')

vim.keymap.set('n', 'K', function()
  vim.lsp.buf.hover({border = 'rounded' })
end, { desc = "LSP Hover"})
