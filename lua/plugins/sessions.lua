return {
  -- "rmagatti/auto-session",
  -- config = function()
  --   require("auto-session").setup({
  --     auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
  --     auto_session_create_enabled = false,
  --     auto_session_use_git_branch = true,
  --     auto_clean_after_session_restore = false,
  --     bypass_session_save_file_types = { "neo-tree" },
  --     session_lens = {
  --       buftypes_to_ignore = {}, -- list of buffer types what should not be deleted from current session
  --       load_on_setup = true,
  --       theme_conf = { border = true },
  --       previewer = false,
  --     },
  --     pre_save_cmds = {
  --       require("neo-tree").close_all()
  --     },
  --     -- post_restore_cmds = {
  --     --   require("neo-tree.sources.manager").show('filesystem')
  --     -- }
  --   })
  --
  --   vim.keymap.set("n", "<Leader>as", require("auto-session.session-lens").search_session, {
  --     noremap = true,
  --   })
  -- end
  {
    "folke/persistence.nvim",
    event = "BufReadPre",
    opts = {
      options = vim.opt.sessionoptions:get(),
      pre_save = function()
        require("neo-tree").close_all()
        
      end
    },
    -- stylua: ignore
    keys = {
      { "<leader>qs", function() require("persistence").load() end,                desc = "Restore Session" },
      { "<leader>ql", function() require("persistence").load({ last = true }) end, desc = "Restore Last Session" },
      { "<leader>qd", function() require("persistence").stop() end,                desc = "Don't Save Current Session" },
    },

  }
}
