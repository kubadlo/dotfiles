return {
    "folke/trouble.nvim",
    cmd = "Trouble",
    keys = {
        { "<leader>cd", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", desc = "Buffer diagnostics" },
        { "<leader>cD", "<cmd>Trouble diagnostics toggle<cr>",              desc = "Workspace diagnostics" },
        { "<leader>xL", "<cmd>Trouble loclist toggle<cr>",                  desc = "Location list" },
        { "<leader>xQ", "<cmd>Trouble qflist toggle<cr>",                   desc = "Quickfix list" }, },
    opts = {},
}
