-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Example configs: https://github.com/LunarVim/starter.lvim
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny
--
lvim.leader=';'
vim.opt.relativenumber = true
vim.g["diagnostics_active"] = true

function Toggle_diagnostics()
    if vim.g.diagnostics_active then
        vim.g.diagnostics_active = false
        vim.diagnostic.enable(false)
    else
        vim.g.diagnostics_active = true
        vim.diagnostic.enable()
    end
end

lvim.plugins = {
 { "tpope/vim-dadbod" },
 { "kristijanhusak/vim-dadbod-completion"},
 { "kristijanhusak/vim-dadbod-ui"},
}

lvim.builtin.which_key.mappings["lh"]  = { "<cmd>lua Toggle_diagnostics()<CR>", "Toggle Diagnostics" }
lvim.builtin.which_key.mappings["bc"] = lvim.builtin.which_key.mappings.c
lvim.builtin.which_key.mappings.c = {} -- Remove reassigned 'c' mapping
lvim.builtin.which_key.mappings.f = lvim.builtin.which_key.mappings.s
lvim.builtin.which_key.mappings.s = {} -- Remove reassigned 's' mapping
lvim.builtin.which_key.mappings.f["g"] = lvim.builtin.which_key.mappings.f["t"]
lvim.builtin.which_key.mappings.f["t"] = {"<cmd>Telescope grep_string<CR>", "text under cursor"}
lvim.builtin.which_key.mappings.f.c = lvim.builtin.which_key.mappings.L.c -- Add configuration editing as 'c' key
lvim.builtin.which_key.mappings["dB"] = lvim.builtin.which_key.mappings.d.b
lvim.builtin.which_key.mappings["db"] = { "obreakpoint()<ESC>", "Set breakpoint()"}

-- Terminal configuration options
lvim.builtin.terminal.open_mapping = '<c-_>'
-- Use <ESC> to escape terminal input mode
vim.api.nvim_set_keymap('t', '<ESC>', '<C-\\><C-n>', {noremap = true, silent = true})
