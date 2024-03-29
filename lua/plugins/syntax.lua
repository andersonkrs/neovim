return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
      "RRethy/nvim-treesitter-endwise",
    },
    config = function()
      local configs = require("nvim-treesitter.configs")
      configs.setup({
        auto_install = true,
        sync_install = false,
        highlight = {
          enable = true,
          -- Some languages depend on vim's regex highlighting system (such as Ruby) for indent rules.
          --  If you are experiencing weird indenting issues, add the language to
          --  the list of additional_vim_regex_highlighting and disabled languages for indent.
          additional_vim_regex_highlighting = { "ruby" },
        },
        indent = {
          enable = true,
          disable = { "ruby" },
        },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "<C-s>", -- set to `false` to disable one of the mappings
            node_incremental = "<C-s>",
            scope_incremental = "<Leader>sc",
            node_decremental = "<Leader>sd",
          },
        },
        textobjects = {
          enable = true,
          select = {
            enable = true,

            -- Automatically jump forward to textobj, similar to targets.vim
            lookahead = true,

            keymaps = {
              -- You can use the capture groups defined in textobjects.scm
              ["af"] = "@function.outer",
              ["if"] = "@function.inner",
              ["ac"] = "@class.outer",
            },
          },
          -- swap = {
          --   enable = true,
          --   swap_next = {
          --     ["<leader>a"] = "@parameter.inner",
          --   },
          --   swap_previous = {
          --     ["<leader>A"] = "@parameter.inner",
          --   },
          -- },
          move = {
            enable = true,
            goto_next_start = {
              ["]f"] = "@function.outer",
              ["]c"] = "@class.outer",
              ["]p"] = "@parameter.outer",

              ["]m"] = "@function.outer",
              --
              ["]z"] = { query = "@scope", query_group = "locals", desc = "Next scope" },
            },
            goto_next_end = {
              ["]F"] = "@function.outer",
              ["]C"] = "@class.outer",
            },
            goto_previous_start = {
              ["[f"] = "@function.outer",
              ["[c"] = "@class.outer",
              ["[p"] = "@parameter.outer",
            },
            goto_previous_end = { ["[F"] = "@function.outer", ["[C"] = "@class.outer" },
          },
        },
        matchup = { enable = true },
        endwise = { enable = true },
      })

      -- Add support for ERB
      local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
      parser_config.erb = {
        install_info = {
          url = "https://github.com/tree-sitter/tree-sitter-embedded-template",
          files = { "src/parser.c" },
          requires_generate_from_grammar = true,
        },
        filetype = "erb",
      }
      parser_config.ejs = {
        install_info = {
          url = "https://github.com/tree-sitter/tree-sitter-embedded-template",
          files = { "src/parser.c" },
          requires_generate_from_grammar = true,
        },
        filetype = "ejs",
      }
    end,

    vim.keymap.set("n", "[x", function()
      require("treesitter-context").go_to_context(vim.v.count1)
    end, { silent = true, desc = "Jump to the most outer context" }),
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    event = { "BufReadPost", "BufWritePost", "BufNewFile" },
    enabled = true,
    opts = { mode = "cursor", max_lines = 3 },
  },
  -- Quickly swap surrounding elements
  { "tpope/vim-surround" },
  -- Quickly switch between single-line and multi-line elements
  {
    "AndrewRadev/splitjoin.vim",
    config = function()
      vim.cmd("let g:splitjoin_ruby_hanging_args = 0")
      vim.cmd("let g:splitjoin_ruby_options_as_arguments = 1")
      vim.keymap.set("n", "<leader>gj", "<cmd>SplitjoinJoin<CR>", { desc = "Join in a single line" })
      vim.keymap.set("n", "<leader>gs", "<cmd>SplitjoinSplit<CR>", { desc = "Split in a single line" })
    end,
  },
  -- Navigate language elements using %
  -- {
  --   "andymass/vim-matchup",
  --   config = function()
  --     vim.g.matchup_matchparen_stopline = 400
  --     vim.g.matchup_matchparen_offscreen = { method = "popup" }
  --   end,
  -- },
  {
    "RRethy/vim-illuminate",
    event = { "BufReadPost", "BufWritePost", "BufNewFile" },
    opts = {
      providers = {
        "lsp",
        "treesitter",
        "regex",
      },
      delay = 200,
      large_file_cutoff = 2000,
    },
    config = function(_, opts)
      require("illuminate").configure(opts)

      local function map(key, dir, buffer)
        vim.keymap.set("n", key, function()
          require("illuminate")["goto_" .. dir .. "_reference"](false)
        end, { desc = dir:sub(1, 1):upper() .. dir:sub(2) .. " Reference", buffer = buffer })
      end

      map("]]", "next")
      map("[[", "prev")

      -- also set it after loading ftplugins, since a lot overwrite [[ and ]]
      vim.api.nvim_create_autocmd("FileType", {
        callback = function()
          local buffer = vim.api.nvim_get_current_buf()
          map("]]", "next", buffer)
          map("[[", "prev", buffer)
        end,
      })
    end,
    keys = {
      { "]]", desc = "Next Reference" },
      { "[[", desc = "Prev Reference" },
    },
  },
  {
    "vim-ruby/vim-ruby",
  },
}
