return {
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.5",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local telescope = require("telescope")

      telescope.setup({
        pickers = {
          find_files = {
            hidden = true,
          },
          oldfiles = {
            cwd_only = true,
          },
        },
      })

      local builtin = require("telescope.builtin")
      vim.keymap.set("n", "<C-p>", "<cmd>Telescope find_files search_dirs=.<CR>", {})
      vim.keymap.set("n", "<C-k>", "<cmd>Telescope live_grep search_dirs=.<CR>", {})
      vim.keymap.set(
        "n",
        "<C-h>",
        "<Cmd>Telescope oldfiles search_dirs=.<CR>",
        { desc = "Telescope Recent Files" }
      )
      vim.keymap.set("n", "<C-s>", builtin.lsp_document_symbols, { desc = "Telescope Document Symbols" })
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
}
