return {
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup()
		end,
		event = { "BufReadPost", "BufWritePost", "BufNewFile" },
		keys = {
			{ "<Leader>hp", "<cmd>Gitsigns preview_hunk<CR>", mode = { "n", "v" }, desc = "Preview Hunk" },
			{ "<Leader>hb", "<cmd>Gitsigns toggle_current_line_blame<CR>", mode = { "n", "v" }, desc = "Toggle Blame" },
			{
				"]h",
				"<cmd>Gitsigns next_hunk<CR>",
				mode = { "n", "v" },
				desc = "Move Next Hunk",
			},
			{
				"[h",
				"<cmd>Gitsigns prev_hunk<CR>",
				mode = { "n", "v" },
				desc = "Move Previous Hunk",
			},
		},
	},
	{
		"tpope/vim-fugitive",
	},
	{
		"tpope/vim-rhubarb",
		keys = {
			{ "<Leader>go", "<cmd>.GBrowse<CR>", mode = { "n", "v" }, desc = "Browse Code in Github" },
			{ "<Leader>gh", "<cmd>.GBrowse!<CR>", mode = { "n", "v" }, desc = "Copy Github" },
		},
	},
	{
		"kdheepak/lazygit.nvim",
		cmd = {
			"LazyGit",
			"LazyGitConfig",
			"LazyGitCurrentFile",
			"LazyGitFilter",
			"LazyGitFilterCurrentFile",
		},
		-- optional for floating window border decoration
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		keys = {
			{ "<Leader>gg", "<cmd>LazyGit<CR>", mode = { "n", "v" }, desc = "Open LazyGit" },
		},
	},
}
