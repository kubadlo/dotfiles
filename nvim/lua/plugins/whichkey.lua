return {
    "folke/which-key.nvim",
    event = "VimEnter",
    ---@type wk.Opts
    opts = {
        preset = "helix",
        spec = {
            { "[",         group = "Previous" },
            { "]",         group = "Next" },
            { "g",         group = "Go to" },
            { "s",         group = "Surround" },
            { "z",         group = "Fold" },
            { "<leader>b", group = "Buffers" },
            { "<leader>c", group = "Code" },
            { "<leader>f", group = "Files" },
            { "<leader>g", group = "Git" },
            { "<leader>h", group = "Git hunks" },
            { "<leader>s", group = "Search" },
            { "<leader>q", group = "Quit" },
            { "<leader>x", group = "Quickfix" },
        },
    },
}
