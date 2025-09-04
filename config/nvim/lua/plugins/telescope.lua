return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  },
  opts = {
    defaults = {
      mappings = {
        i = {
          ["<C-j>"] = require("telescope.actions").move_selection_next,
          ["<C-k>"] = require("telescope.actions").move_selection_previous,
        },
        n = {
          ["<C-j>"] = require("telescope.actions").move_selection_next,
          ["<C-k>"] = require("telescope.actions").move_selection_previous,
        },
      },
      -- Enhanced visual appearance
      selection_caret = "▶ ",
      prompt_prefix = "🔍 ",
      layout_strategy = "horizontal",
      layout_config = {
        horizontal = {
          width = 0.9,
          height = 0.8,
          preview_width = 0.5,
        },
      },
      borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
    },
  },
  config = function(_, opts)
    require("telescope").setup(opts)
    require("telescope").load_extension("fzf")

    -- Create a more pronounced highlight for the selected item
    vim.api.nvim_create_autocmd("ColorScheme", {
      pattern = "*",
      callback = function()
        -- Make the selected item highlight more pronounced
        vim.api.nvim_set_hl(0, "TelescopeSelection", {
          bg = "#3a4b5c",
          fg = "#ffffff",
          bold = true
        })

        -- Enhance the border highlight
        vim.api.nvim_set_hl(0, "TelescopeBorder", {
          fg = "#4d78cc"
        })

        -- Enhance the prompt highlight
        vim.api.nvim_set_hl(0, "TelescopePromptTitle", {
          fg = "#ffffff",
          bg = "#4d78cc",
          bold = true
        })

        -- Enhance the results highlight
        vim.api.nvim_set_hl(0, "TelescopeResultsTitle", {
          fg = "#ffffff",
          bg = "#4d78cc",
          bold = true
        })

        -- Enhance the preview highlight
        vim.api.nvim_set_hl(0, "TelescopePreviewTitle", {
          fg = "#ffffff",
          bg = "#4d78cc",
          bold = true
        })
      end,
    })
  end,
}
