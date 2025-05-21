return {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {},
    keys = {
        { "s", function() require("flash").jump() end,       desc = "Flash" },
        { "S", function() require("flash").treesitter() end, desc = "Flash Treesitter" },
    },
}
