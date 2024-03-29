vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set softtabstop=2")
vim.cmd("set number")
vim.cmd("set relativenumber")
vim.cmd("set undofile")
vim.cmd("set undodir=~/.vim/undo")
vim.cmd("set spelllang=en_us")
vim.cmd("set splitright")
vim.cmd("set nowrap")

-- Disable spelling for terminal windows
vim.cmd("au TermOpen * setlocal nospell")

-- Enable spelling for markdown files & latex
vim.cmd("autocmd BufRead,BufNewFile *.md setlocal spell")
vim.cmd("autocmd BufRead,BufNewFile *.tex setlocal spell")

--Keeps screen centered between jumps
vim.cmd("set scrolloff=10")

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.opt.clipboard = "unnamedplus"

-- Enable break indent
vim.opt.breakindent = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.g.mapleader = " "

-- Remaps for moving lines holding SHIFT
vim.cmd("nnoremap K :m .-2<CR>==")
vim.cmd("nnoremap J :m .+1<CR>==")
vim.cmd("vnoremap K :m '<-2<CR>gv=gv")
vim.cmd("vnoremap J :m '>+1<CR>gv=gv")

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Enable column increment letters!!!!!
vim.cmd("set nrformats+=alpha")

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})
