local noremap = { noremap = true, silent = true }
local nnoremap = { nnoremap = true, silent = true }
local term_opts = { silent = true }

local keymap = vim.keymap.set

vim.g.mapleader = " "

keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

keymap("i", "jj", "<ESC>", opts)

keymap("t", "<ESC>", "<C-\\><C-n>", opts)

keymap("n", "<Space>e", ":Fern .<CR>", opts)

keymap("n", "<ESC><ESC>", ":nohlsearch<CR><ESC>", opts)
