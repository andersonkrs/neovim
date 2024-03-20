vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set softtabstop=2")
vim.cmd("set number")
vim.cmd("set relativenumber")
vim.cmd("set undofile")
vim.cmd("set undodir=~/.vim/undo")
-- vim.cmd("set spelllang=en_us")
-- vim.cmd("set spell")
vim.cmd("set splitright")
vim.cmd("set nowrap")

-- Disable spelling for terminal windows
vim.cmd("au TermOpen * setlocal nospell")

--Keeps screen centered between jumps
vim.cmd("set scrolloff=999")

vim.g.mapleader = " "

-- Sync clipboard with system
vim.api.nvim_set_option("clipboard", "unnamed")

vim.cmd("nnoremap K :m .-2<CR>==")
vim.cmd("nnoremap J :m .+1<CR>==")
vim.cmd("vnoremap K :m '<-2<CR>gv=gv")
vim.cmd("vnoremap J :m '>+1<CR>gv=gv")
