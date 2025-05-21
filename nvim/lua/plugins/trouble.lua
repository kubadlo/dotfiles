return {
    "folke/trouble.nvim",
    opts = {},
    keys = {
        { "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>",              desc = "Diagnostics", },
        { "<leader>xb", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", desc = "Buffer Diagnostics", },
        { "<leader>xl", "<cmd>Trouble loclist toggle<cr>",                  desc = "Location List", },
        { "<leader>xq", "<cmd>Trouble qflist toggle<cr>",                   desc = "Quickfix List", },
    },

}
