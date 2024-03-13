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
				vim.keymap.set("n", "K", function()
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
			-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
			require("lspconfig")["solargraph"].setup({ capabilities = capabilities })
			require("lspconfig")["html"].setup({ capabilities = capabilities })
			require("lspconfig")["cssls"].setup({ capabilities = capabilities })
			require("lspconfig")["tsserver"].setup({ capabilities = capabilities })
			require("lspconfig").eslint.setup({
				capabilities = capabilities,
				on_attach = function(client, bufnr)
					vim.api.nvim_create_autocmd("BufWritePre", {
						buffer = bufnr,
						command = "EslintFixAll",
					})
				end,
			})
			require("lspconfig")["lua_ls"].setup({ capabilities = capabilities })
			require("lspconfig")["graphql"].setup({ capabilities = capabilities })

			lsp.setup()
		end,
	},
}
