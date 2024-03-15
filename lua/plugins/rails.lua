return {
  {
    "tpope/vim-rails",
    config = function()
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "eruby.yaml",
        command = "set filetype=yaml",
      })

      vim.keymap.set({ "n", "v" }, "<C-A>", "<cmd>A<CR>", { desc = "Alternate between rails files" })
    end,
  },
}
