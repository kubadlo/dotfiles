return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
        preset = "helix",
        spec = {
            mode = { "n", "v" },
            { "[",             group = "Prev" },
            { "]",             group = "Next" },
            { "g",             group = "Go to" },
            { "z",             group = "fold" },
            { "<leader><tab>", group = "Tabs" },
            { "<leader>b",     group = "Buffers" },
            { "<leader>c",     group = "Code" },
            { "<leader>f",     group = "Files" },
            { "<leader>g",     group = "Git" },
            { "<leader>s",     group = "Search" },
            { "<leader>q",     group = "Quit" },
            { "<leader>x",     group = "Diagnostics" },
        },
    },
}
