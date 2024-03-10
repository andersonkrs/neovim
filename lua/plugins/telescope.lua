return {
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.5",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local telescope = require('telescope')

      telescope.setup({
        pickers = {
          find_files = {
            hidden = true
          }
        }
      })

      local builtin = require("telescope.builtin")
      vim.keymap.set("n", "<C-p>", builtin.find_files, {})
      vim.keymap.set("n", "<C-k>", builtin.live_grep, {})
      vim.keymap.set("n", "<C-h>", "<Cmd>Telescope oldfiles<CR>")
      vim.keymap.set("n", "<C-@>", builtin.lsp_document_symbols, {})
    end,
  },
  {
    "nvim-telescope/telescope-ui-select.nvim",
    config = function()
      require("telescope").setup({
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown({
              -- even more opts
            }),
          },
        },
      })

      require("telescope").load_extension("ui-select")
    end,
  },
  {
    "debugloop/telescope-undo.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require("telescope").setup({
        -- the rest of your telescope config goes here
        extensions = {
          undo = {
            -- telescope-undo.nvim config, see below
          },
          -- other extensions:
          -- file_browser = { ... }
        },
      })
      require("telescope").load_extension("undo")
      vim.keymap.set("n", "<leader>us", "<cmd>Telescope undo<cr>")
    end,
  }
  -- {
  --   "nvim-telescope/telescope-frecency.nvim",
  --   config = function()
  --     require("telescope").load_extension "frecency"
  --
  --     vim.keymap.set("n", "<leader>rf", "<Cmd>Telescope frecency<CR>")
  --   end,
  -- }
}
