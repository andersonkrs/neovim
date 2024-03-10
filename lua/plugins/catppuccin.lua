return {
  "catppuccin/nvim",
  lazy = false,
  name = "catppuccin",
  priority = 1000,
  config = function()
    vim.cmd.colorscheme "catppuccin"
    -- Set unercurls for diagnostics
    local hl_groups = { 'DiagnosticUnderlineError', 'DiagnosticUnderlineWarn', 'DiagnosticUnderlineInfo', 'DiagnosticUnderlineHint' }
    for _, hl in ipairs(hl_groups) do
      vim.cmd.highlight(hl .. ' gui=undercurl')
    end
  end
}
