return {
    "folke/flash.nvim",
    keys = {
        { "<CR>", function() require("flash").jump() end, desc = "Flash" },
    },
    opts = {},
}
