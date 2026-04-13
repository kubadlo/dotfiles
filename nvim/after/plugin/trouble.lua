vim.pack.add({
    "https://github.com/folke/trouble.nvim",
})

local keymap = {
    { "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", "Diagnostics" },
    { "<leader>xl", "<cmd>Trouble loclist toggle<cr>",     "Location list" },
    { "<leader>xq", "<cmd>Trouble qflist toggle<cr>",      "Quickfix list" },
}

require("trouble").setup()

for _, mapping in pairs(keymap) do
    vim.keymap.set("n", mapping[1], mapping[2], { desc = mapping[3] })
end
