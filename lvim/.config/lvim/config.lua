-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Example configs: https://github.com/LunarVim/starter.lvim
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny
--
lvim.leader=';'
vim.opt.relativenumber = true

lvim.plugins = {
  { url="https://git.sr.ht/~havi/telescope-toggleterm.nvim",
    event = "TermOpen",
    dependencies = {
       "akinsho/nvim-toggleterm.lua",
       "nvim-telescope/telescope.nvim",
       "nvim-lua/popup.nvim",
       "nvim-lua/plenary.nvim",
    },
    open_mapping = '<c-_>',
    config = function()
       require("telescope").load_extension("toggleterm")
      -- Use <ESC> to escape terminal input mode
      vim.api.nvim_set_keymap('t', '<ESC><ESC>', '<C-\\><C-n>', {noremap = true, silent = true})
    end,
  },
  { "nvim-neotest/neotest",
      dependencies = {
        "nvim-neotest/nvim-nio",
        "nvim-lua/plenary.nvim",
        "antoinemadec/FixCursorHold.nvim",
        "nvim-treesitter/nvim-treesitter",
        "nvim-neotest/neotest-python"
      },
      adapters = { require("neotest-python")({runner="pytest"}) },
  },
  { "ThePrimeagen/git-worktree.nvim",
     lazy = false,
    config = function ()
      require("telescope").load_extension("git_worktree")
    end,
  },
  { "linux-cultist/venv-selector.nvim",
      dependencies = {
        "neovim/nvim-lspconfig",
        "mfussenegger/nvim-dap", "mfussenegger/nvim-dap-python", --optional
        { "nvim-telescope/telescope.nvim", branch = "0.1.x", dependencies = { "nvim-lua/plenary.nvim" } },
      },
    lazy = false,
    branch = "regexp", -- This is the regexp branch, use this for the new version
    config = function()
        require("venv-selector").setup()
      end,
    keys = { { "<leader>v", "<cmd>VenvSelect<cr>", "Select Env" } },
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
    keys = {
      {
        "<leader>?",
        function()
          require("which-key").show({ global = false })
        end,
        desc = "Buffer Local Keymaps (which-key)",
      },
    },
  }
}

-- Toggle diagnostics on/off with
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
--lvim.builtin.which_key.mappings["lh"]  = { "<cmd>lua Toggle_diagnostics()<CR>", "Toggle Diagnostics" }
--lvim.builtin.which_key.mappings["bc"] = lvim.builtin.which_key.mappings.c
--lvim.builtin.which_key.mappings.c = {} -- Remove reassigned 'c' mapping
--lvim.builtin.which_key.mappings.f = lvim.builtin.which_key.mappings.s
--lvim.builtin.which_key.mappings.s = {} -- Remove reassigned 's' mapping
--lvim.builtin.which_key.mappings.f["g"] = lvim.builtin.which_key.mappings.f["t"]
--lvim.builtin.which_key.mappings.f["t"] = {"<cmd>Telescope grep_string<CR>", "text under cursor"}
--lvim.builtin.which_key.mappings.f["T"] = {"<cmd>Telescope toggleterm<CR>", "existing terminal"}
--lvim.builtin.which_key.mappings.f.c = lvim.builtin.which_key.mappings.L.c -- Add configuration editing as 'c' key
--lvim.builtin.which_key.mappings["dB"] = lvim.builtin.which_key.mappings["db"]
--lvim.builtin.which_key.mappings["db"] = { "obreakpoint()<ESC>", "Set breakpoint()"}
--lvim.builtin.which_key.mappings["dm"] = { "<cmd>lua require('neotest').run.run()<cr>", "nearest test" }
--lvim.builtin.which_key.mappings["gw"] = {"<cmd>lua require('telescope').extensions.git_worktree.git_worktrees()<cr>", "list worktrees"}
--lvim.builtin.which_key.mappings["gW"] = {"<cmd>lua require('telescope').extensions.git_worktree.create_git_worktree()<cr>", "create worktree"}
--lvim.builtin.which_key.mappings["v"] =  { "<cmd>VenvSelect<cr>", "Select Env" }
lvim.builtin.telescope.defaults.layout_config = { width = .95 }
