return {
    "folke/trouble.nvim",
    cmd = "Trouble",
    keys = {
        { "<leader>dd", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", desc = "Buffer diagnostics" },
        { "<leader>dD", "<cmd>Trouble diagnostics toggle<cr>",              desc = "Workspace diagnostics" },
        { "<leader>xL", "<cmd>Trouble loclist toggle<cr>",                  desc = "Location list" },
        { "<leader>xQ", "<cmd>Trouble qflist toggle<cr>",                   desc = "Quickfix list" }, },
    opts = {},
}
