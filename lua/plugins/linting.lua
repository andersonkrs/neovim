return {
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      use_diagnostic_signs = true,
    },
    keys = {
      { "<leader>xx", "<cmd>TroubleToggle document_diagnostics<cr>", desc = "Document Diagnostics (Trouble)" },
      { "<leader>xL", "<cmd>TroubleToggle loclist<cr>",              desc = "Location List (Trouble)" },
      { "<leader>xQ", "<cmd>TroubleToggle quickfix<cr>",             desc = "Quickfix List (Trouble)" },
    },
    config = function()
      vim.keymap.set({ "n", "v" }, "<leader>x]", function()
        local trouble = require("trouble")

        trouble.open()
        trouble.next({ skip_groups = true, jump = true })
      end, { desc = "Next diagnostic (Trouble)" })

      vim.keymap.set({ "n", "v" }, "<leader>x[", function()
        local trouble = require("trouble")

        trouble.open()
        trouble.previous({ skip_groups = true, jump = true })
      end, { desc = "Previous diagnostic (Trouble)" })
    end,
  },
}
