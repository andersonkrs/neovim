return {
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		config = function()
			require("toggleterm").setup({
				open_mapping = [[<c-T>]],
				direction = "float",
				float_opts = {
					border = "rounded",
					winblend = 0,
					highlights = {
						border = "Normal",
						background = "Normal",
					},
				},
				on_open = function()
					vim.cmd("setlocal nospell")
				end,
			})

			local Terminal = require("toggleterm.terminal").Terminal
			local rails_console = Terminal:new({ cmd = "bin/rails c", hidden = true })

			function _rails_console()
				rails_console:toggle()
			end

			vim.api.nvim_set_keymap(
				"n",
				"<leader>rc",
				"<cmd>lua _rails_console()<CR>",
				{ noremap = true, silent = true, desc = "Launch [R]ails [C]onsole" }
			)
		end,
	},
}
