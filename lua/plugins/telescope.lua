return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local telescope = require("telescope")

      telescope.setup({
        pickers = {
          find_files = {
            hidden = true,
          },
          oldfiles = {
            cwd_only = true,
          },
        },
      })

      local builtin = require("telescope.builtin")
      vim.keymap.set("n", "<C-N>", "<cmd>Telescope find_files search_dirs=.<CR>", {})
      vim.keymap.set("n", "<C-F>", "<cmd>Telescope live_grep search_dirs=.<CR>", {})
      vim.keymap.set(
        "n",
        "<C-E>",
        "<Cmd>Telescope oldfiles search_dirs=.<CR>",
        { desc = "Telescope Recent Files" }
      )
      vim.keymap.set("n", "<leader>ls", builtin.lsp_document_symbols, { desc = "Telescope Document Symbols" })
      vim.keymap.set("n", "<leader>gb", builtin.git_branches, { desc = "Telescope list branches" })
      vim.keymap.set(
        "n",
        "<leader>qi",
        "<cmd>Telescope lsp_implementations search_dirs=.<CR>",
        { desc = "Telescope preview implemetations" }
      )
    end,
  },
  {
    "nvim-telescope/telescope-ui-select.nvim",
    config = function()
      require("telescope").setup({
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown({
              -- even more opts
            }),
          },
        },
      })

      require("telescope").load_extension("ui-select")
    end,
  },
  -- {
  -- 	"otavioschwanck/telescope-alternate",
  -- 	config = function()
  -- 		require("telescope-alternate").setup({
  -- 			mappings = {
  -- 				{
  -- 					"pack/(*)/app/public/(*)//(.*)_services/(.*).rb",
  -- 						{ "app/contracts/[1]_contracts/[2].rb", "Contract" }, -- Adding label to switch
  -- 					},
  -- 				},
  -- 				{ "app/contracts/(.*)_contracts/(.*).rb", { { "app/services/[1]_services/[2].rb", "Service" } } }, -- from contracts to services
  -- 				-- Search anything on helper folder that contains pluralize version of model.
  -- 				--Example: app/models/user.rb -> app/helpers/foo/bar/my_users_helper.rb
  -- 				{ "app/models/(.*).rb", { { "db/helpers/**/*[1:pluralize]*.rb", "Helper" } } },
  -- 				{ "app/**/*.rb", { { "spec/[1].rb", "Test" } } }, -- Alternate between file and test
  -- 			},
  -- 			presets = { "rails", "rspec", "nestjs", "angular" }, -- Telescope pre-defined mapping presets
  -- 			open_only_one_with = "current_pane", -- when just have only possible file, open it with.  Can also be horizontal_split and vertical_split
  -- 			transformers = { -- custom transformers
  -- 				change_to_uppercase = function(w)
  -- 					return my_uppercase_method(w)
  -- 				end,
  -- 			},
  -- 			-- telescope_mappings = { -- Change the telescope mappings
  -- 			--   i = {
  -- 			--     open_current = '<CR>',
  -- 			--     open_horizontal = '<C-s>',
  -- 			--     open_vertical = '<C-v>',
  -- 			--     open_tab = '<C-t>',
  -- 			--   },
  -- 			--   n = {
  -- 			--     open_current = '<CR>',
  -- 			--     open_horizontal = '<C-s>',
  -- 			--     open_vertical = '<C-v>',
  -- 			--     open_tab = '<C-t>',
  -- 			--   }
  -- 			-- }
  -- 		})
  --
  -- 		require("telescope").load_extension("telescope-alternate")
  -- 	end,
  -- },
}
