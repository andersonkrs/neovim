return {
  -- "rmagatti/auto-session",
  -- config = function()
  --   require("auto-session").setup({
  --     auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
  --     session_lens = {
  --       buftypes_to_ignore = {}, -- list of buffer types what should not be deleted from current session
  --       load_on_setup = true,
  --       theme_conf = { border = true },
  --       previewer = false,
  --     },
  --   })
  --
  --   vim.keymap.set("n", "<Leader>as", require("auto-session.session-lens").search_session, {
  --     noremap = true,
  --   })
  -- end
  {
    "folke/persistence.nvim",
    event = "BufReadPre",
    opts = { options = vim.opt.sessionoptions:get() },
    -- stylua: ignore
    keys = {
      { "<leader>qs", function() require("persistence").load() end,                desc = "Restore Session" },
      { "<leader>ql", function() require("persistence").load({ last = true }) end, desc = "Restore Last Session" },
      { "<leader>qd", function() require("persistence").stop() end,                desc = "Don't Save Current Session" },
    },

  }
}
