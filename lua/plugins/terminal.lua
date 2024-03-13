return {
  {
    'akinsho/toggleterm.nvim',
    version = "*",
    config = function()
      require("toggleterm").setup({
        on_open = function()
          vim.cmd("setlocal nospell")
        end
      })
    end,
    keys = {
      { "<C-T>", "<cmd>ToggleTerm name=main suze=20<CR>" }
    }
  },
}
