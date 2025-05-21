-- Set <Space> as a leader key
vim.g.mapleader = " "

-- File managment
vim.keymap.set("n", "<leader>fv", vim.cmd.Ex)
vim.keymap.set("n", "<leader>fn", "<cmd>enew<CR>", { desc = "New File" })

-- Better indenting
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- Move to window using the <ctrl> hjkl keys
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Go to Left Window", remap = true })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Go to Lower Window", remap = true })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Go to Upper Window", remap = true })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Go to Right Window", remap = true })

-- Resize window using <ctrl> arrow keys
vim.keymap.set("n", "<C-Up>", "<cmd>resize +2<CR>", { desc = "Increase Window Height" })
vim.keymap.set("n", "<C-Down>", "<cmd>resize -2<CR>", { desc = "Decrease Window Height" })
vim.keymap.set("n", "<C-Left>", "<cmd>vertical resize -2<CR>", { desc = "Decrease Window Width" })
vim.keymap.set("n", "<C-Right>", "<cmd>vertical resize +2<CR>", { desc = "Increase Window Width" })

-- Move Lines
vim.keymap.set("n", "<A-j>", "<cmd>execute 'move .+' . v:count1<CR>==", { desc = "Move Down" })
vim.keymap.set("n", "<A-k>", "<cmd>execute 'move .-' . (v:count1 + 1)<CR>==", { desc = "Move Up" })
vim.keymap.set("i", "<A-j>", "<esc><cmd>m .+1<CR>==gi", { desc = "Move Down" })
vim.keymap.set("i", "<A-k>", "<esc><cmd>m .-2<CR>==gi", { desc = "Move Up" })
vim.keymap.set("v", "<A-j>", ":<C-u>execute \"'<,'>move '>+\" . v:count1<CR>gv=gv", { desc = "Move Down" })
vim.keymap.set("v", "<A-k>", ":<C-u>execute \"'<,'>move '<-\" . (v:count1 + 1)<CR>gv=gv", { desc = "Move Up" })

-- Buffers
vim.keymap.set("n", "<leader>bb", "<cmd>e #<CR>", { desc = "Switch to Other Buffer" })

-- Git actions
vim.keymap.set("n", "<leader>gt", function() MiniDiff.toggle_overlay(0) end, { desc = "Toggle hunks overlay" })

-- LSP code actions
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code actions" })
vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename, { desc = "Rename" })
vim.keymap.set("n", "<leader>cf", function() vim.lsp.buf.format({ async = true }) end, { desc = "Format" })

-- Quit neovim
vim.keymap.set("n", "<leader>qq", "<cmd>qa<CR>", { desc = "Quit" })
