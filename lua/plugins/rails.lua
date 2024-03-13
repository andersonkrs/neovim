return {
  {
    "tpope/vim-rails",
    config = function ()
      vim.keymap.set({ "n", "v" }, "<C-A>", "<cmd>A<CR>", { desc = "Alternate between rails files" })
    end
  }
}
