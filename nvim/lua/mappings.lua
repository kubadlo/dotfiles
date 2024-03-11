-- Set <Space> as a leader key
vim.g.mapleader = ' '

-- Integrated file manager
vim.keymap.set('n', '<leader>fv', vim.cmd.Ex)

-- Clear search results on pressing <Esc> in normal mode
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
