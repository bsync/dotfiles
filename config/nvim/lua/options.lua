require "nvchad.options"

-- add yours here!

local o = vim.o
o.cursorline=true
o.cursorcolumn =true
o.cursorlineopt ='both' -- to enable cursorline!
vim.api.nvim_set_hl(0, 'CursorLine', { bg = '#505090' })
vim.api.nvim_set_hl(0, 'CursorColumn', { bg = '#505090' })

