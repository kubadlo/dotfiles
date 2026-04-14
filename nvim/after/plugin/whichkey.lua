vim.pack.add({
    "https://github.com/folke/which-key.nvim",
})

---@type wk.Opts
local config = {
    preset = "helix",
    spec = {
        mode = { "n", "x" },
        { "<leader><tab>", group = "Tabs" },
        { "<leader>b",     group = "Buffers" },
        { "<leader>c",     group = "Code" },
        { "<leader>g",     group = "Git" },
        { "<leader>h",     group = "Hunks" },
        { "<leader>s",     group = "Search" },
        { "<leader>q",     group = "Sessions" },
        { "[",             group = "Previous" },
        { "]",             group = "Next" },
        { "g",             group = "Go to" },
        { "s",             group = "Surround" },
        { "z",             group = "Fold" },
    },
}

require("which-key").setup(config)
