return {
	{
		"vim-test/vim-test",
		config = function()
			vim.cmd("let test#strategy = 'toggleterm'")
			vim.cmd("let test#neovim#term_position = 'vertical'")

			vim.keymap.set("n", "<leader>tt", "<cmd>TestNearest<CR>", { desc = "Test Nearest" })
			vim.keymap.set("n", "<leader>tf", "<cmd>TestFile<CR>", { desc = "[T]est [F]ile" })
			vim.keymap.set("n", "<leader>tl", "<cmd>TestLast<CR>", { desc = "[T]est [L]ast" })
			vim.keymap.set("n", "<leader>tg", "<cmd>TestVisit<CR>", { desc = "[T]est Visit" })
		end,
	},
}
