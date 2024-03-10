return {
  "nvimtools/none-ls.nvim",
  config = function()
    local null_ls = require("null-ls")

    local formatting = null_ls.builtins.formatting
    local diagnostics = null_ls.builtins.diagnostics
    local conditional = function(fn)
      local utils = require("null-ls.utils").make_conditional_utils()
      return fn(utils)
    end

    null_ls.setup({
      sources = {
        formatting.prettier,

        -- setting eslint_d only if we have a ".eslintrc.js" file in the project
        -- diagnostics.eslint_d.with({
        --  condition = function(utils)
        --    return utils.root_has_file({ ".eslintrc.js" })
        --  end,
        --}),

        -- Here we set a conditional to call the rubocop formatter. If we have a Gemfile in the project, we call "bundle exec rubocop", if not we only call "rubocop".
        conditional(function(utils)
          return utils.root_has_file("Gemfile")
              and null_ls.builtins.formatting.rubocop.with({
                command = "bundle",
                args = vim.list_extend(
                  { "exec", "rubocop" },
                  null_ls.builtins.formatting.rubocop._opts.args
                ),
              })
              or null_ls.builtins.formatting.rubocop
        end),

        -- Same as above, but with diagnostics.rubocop to make sure we use the proper rubocop version for the project
        conditional(function(utils)
          return utils.root_has_file("Gemfile")
              and null_ls.builtins.diagnostics.rubocop.with({
                command = "bundle",
                args = vim.list_extend(
                  { "exec", "rubocop" },
                  null_ls.builtins.diagnostics.rubocop._opts.args
                ),
              })
              or null_ls.builtins.diagnostics.rubocop
        end),
      },
    })

    local format = function()
      vim.lsp.buf.format({ timeout_ms = 2000 })
    end

    vim.keymap.set("n", "<leader>ff", format, {})
  end,
}
