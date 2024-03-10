return {
  'numToStr/Comment.nvim',
  opts = {
    toggler = {
      ---Line-comment keymap
      line = '<Leader>gc',
      ---Block-comment keymap
      block = '<Leader>guc',
    },
    opleader = {
      ---Line-comment keymap
      line = 'gc',
      ---Block-comment keymap
      block = 'guc',
    },
  },
  lazy = false,
}
