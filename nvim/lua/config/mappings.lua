-- Set <Space> as a leader key
vim.g.mapleader = ' '

-- Integrated file manager
vim.keymap.set('n', '<leader>fv', vim.cmd.Ex)

-- Clear search results on pressing <Esc> in normal mode
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Move selected line / block of text in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
