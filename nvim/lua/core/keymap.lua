-- Set <space> as a leader key
vim.g.mapleader = " "

-- File management
vim.keymap.set("n", "<leader>fv", vim.cmd.Ex, { desc = "Netrw" })
vim.keymap.set("n", "<leader>fn", "<cmd>enew<cr>", { desc = "New File" })

-- Diagnostics
vim.keymap.set("n", "gK", vim.diagnostic.open_float, { desc = "Diagnostics hover" })

-- LSP
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code actions" })
vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename, { desc = "Rename" })
vim.keymap.set("n", "<leader>cf", function() vim.lsp.buf.format({ async = true }) end, { desc = "Format" })

-- Copy/paste with system clipboard
vim.keymap.set({ "n", "x" }, "gy", "\"+y", { desc = "Copy to system clipboard" })
vim.keymap.set("n", "gp", "\"+p", { desc = "Paste from system clipboard" })
vim.keymap.set("x", "gp", "\"+P", { desc = "Paste from system clipboard" })

-- Better indenting
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- Move lines up/down using the <alt> jk keys
vim.keymap.set("n", "<M-j>", "<cmd>execute 'move .+' . v:count1<CR>==", { desc = "Move Down" })
vim.keymap.set("n", "<M-k>", "<cmd>execute 'move .-' . (v:count1 + 1)<CR>==", { desc = "Move Up" })
vim.keymap.set("i", "<M-j>", "<esc><cmd>m .+1<CR>==gi", { desc = "Move Down" })
vim.keymap.set("i", "<M-k>", "<esc><cmd>m .-2<CR>==gi", { desc = "Move Up" })
vim.keymap.set("v", "<M-j>", ":<C-u>execute \"'<,'>move '>+\" . v:count1<CR>gv=gv", { desc = "Move Down" })
vim.keymap.set("v", "<M-k>", ":<C-u>execute \"'<,'>move '<-\" . (v:count1 + 1)<CR>gv=gv", { desc = "Move Up" })

-- Move to window using the <ctrl> hjkl keys
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Go to Left Window", remap = true })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Go to Lower Window", remap = true })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Go to Upper Window", remap = true })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Go to Right Window", remap = true })

-- Quit Neovim easily
vim.keymap.set("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit All" })
