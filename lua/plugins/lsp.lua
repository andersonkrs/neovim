return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "tsserver",
          "solargraph",
          "html",
          "cssls",
          "tsserver",
          "solargraph",
          "eslint",
          "ruby_ls",
        },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
  },
  {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v3.x",
    config = function()
      local lsp = require("lsp-zero")

      lsp.extend_lspconfig()

      lsp.set_sign_icons({
        error = "",
        warning = "",
        hint = "",
        information = "",
        other = "",
      })

      vim.diagnostic.config({
        virtual_text = false,
      })

      lsp.on_attach(function(client, bufnr)
        vim.keymap.set("n", "gd", function()
          vim.lsp.buf.definition()
        end, { desc = "[G]o to [d]efinition", buffer = bufnr, remap = false })
        vim.keymap.set("n", "gD", function()
          vim.lsp.buf.declaration()
        end, { desc = "[G]o to [D]eclaration", buffer = bufnr, remap = false })
        vim.keymap.set("n", "gr", function()
          vim.lsp.buf.references()
        end, { desc = "[G]o to [R]eferences (with LSP)", buffer = bufnr, remap = false })
        vim.keymap.set("n", "gi", function()
          vim.lsp.buf.implementation()
        end, { desc = "[G]o to [I]mplementation (with LSP)", buffer = bufnr, remap = false })
        vim.keymap.set("n", "<leader>K", function()
          vim.lsp.buf.hover()
        end, { desc = "[K] Hover info", buffer = bufnr, remap = false })
        vim.keymap.set("n", "R", function()
          vim.lsp.buf.rename()
        end, { desc = "[R]ename symbol (with LSP)", buffer = bufnr, remap = false })
        vim.keymap.set("n", "<Leader>ca", function()
          vim.lsp.buf.code_action()
        end, { desc = "[C]ode [Action]", buffer = bufnr, remap = false })
        vim.keymap.set("n", "<Leader>xs", function()
          vim.diagnostic.open_float()
        end, { desc = "Show Diagnostic", buffer = bufnr, remap = false })
      end)

      -- Set up lspconfig.
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      local lsp_config = require("lspconfig")
      -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.

      lsp_config["solargraph"].setup({
        capabilities = capabilities,
        root_dir = lsp_config.util.root_pattern("Gemfile", ".git", "."),
        cmd = { "/Users/anderson/.asdf/shims/solargraph", "stdio" },
        filetypes = {
          "ruby",
        },
        flags = {
          debounce_text_changes = 150,
        },
      })

      lsp_config["html"].setup({ capavibilities = capabilities })
      lsp_config["cssls"].setup({ capabilities = capabilities })
      lsp_config["tsserver"].setup({ capabilities = capabilities })
      lsp_config.eslint.setup({
        capabilities = capabilities,
        on_attach = function(client, bufnr)
          vim.api.nvim_create_autocmd("BufWritePre", {
            buffer = bufnr,
            command = "EslintFixAll",
          })
        end,
      })
      lsp_config["lua_ls"].setup({ capabilities = capabilities })
      lsp_config["graphql"].setup({ capabilities = capabilities })
      lsp_config["ltex"].setup({
        capabilities = capabilities,
        settings = {
          ltex = {
            enabled = true,
            filetypes = {
              "gitcommit",
              "markdown",
              "tex",
              "html",
            },
            checkFrequency = "edit",
            language = "en-US ",
            forwardSearch = {
              executable = "zathura",
              args = { "--synctex-forward", "%l:1:%f", "%p" },
              onSave = true,
            },
            chktex = {
              onEdit = true,
              onOpenAndSave = true,
            },
            latexindent = {
              enabled = true,
            },
            latexmk = {
              enabled = true,
            },
            forwardSearch = {
              executable = "zathura",
              args = { "--synctex-forward", "%l:1:%f", "%p" },
              onSave = true,
            },
          },
        },
      })

      lsp.setup()
    end,
  },
}
