return {
  {
    "lewis6991/gitsigns.nvim",
    config = function ()
      require("gitsigns").setup()
    end,
    event =  { "BufReadPost", "BufWritePost", "BufNewFile" },
    keys = {
      { "<Leader>hp", "<cmd>Gitsigns preview_hunk<CR>",              mode = { "n", "v" }, desc = "Preview Hunk" },
      { "<Leader>hb", "<cmd>Gitsigns toggle_current_line_blame<CR>", mode = { "n", "v" }, desc = "Toggle Blame" },
    }
  },
  {
    "tpope/vim-fugitive",
  },
  {
    "kdheepak/lazygit.nvim",
    cmd = {
      "LazyGit",
      "LazyGitConfig",
      "LazyGitCurrentFile",
      "LazyGitFilter",
      "LazyGitFilterCurrentFile",
    },
    -- optional for floating window border decoration
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    keys = {
      { "<Leader>gg", "<cmd>LazyGit<CR>", mode = { "n", "v" }, desc = "Open LazyGit" }
    }
  },
}
