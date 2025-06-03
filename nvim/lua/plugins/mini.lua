return {
    "echasnovski/mini.nvim",
    opts = {},
    config = function()
        require("mini.ai").setup()
        require("mini.pairs").setup()
        require("mini.surround").setup()

        require("mini.git").setup()
        require("mini.diff").setup()

        require("mini.pick").setup()
        require("mini.extra").setup()

        require("mini.icons").setup()
        require("mini.statusline").setup()
    end,
}
