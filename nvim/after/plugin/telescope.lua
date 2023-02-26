local telescope = require("telescope.builtin")

vim.keymap.set("n", "<leader>ff", telescope.find_files, {})
vim.keymap.set("n", "<leader>fa", function()
    telescope.find_files({ hidden = true, no_ignore = true })
end)
vim.keymap.set("n", "<leader>fg", telescope.live_grep, {})
vim.keymap.set("n", "<leader>fb", telescope.buffers, {})
vim.keymap.set("n", "<leader>fh", telescope.help_tags, {})

vim.keymap.set("n", "<leader>lr", telescope.lsp_references, {})
vim.keymap.set("n", "<leader>li", telescope.lsp_implementations, {})
vim.keymap.set("n", "<leader>ld", telescope.lsp_definitions, {})

vim.keymap.set("n", "<leader>gc", telescope.git_commits, {})
vim.keymap.set("n", "<leader>gb", telescope.git_branches, {})
vim.keymap.set("n", "<leader>gs", telescope.git_status, {})
