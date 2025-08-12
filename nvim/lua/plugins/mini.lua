return {
    "echasnovski/mini.nvim",
    event = "BufEnter",
    opts = {},
    config = function()
        -- Text editing
        require("mini.ai").setup()
        require("mini.comment").setup()
        require("mini.pairs").setup()
        require("mini.splitjoin").setup()
        require("mini.surround").setup()

        -- User interface
        require("mini.icons").setup()
        require("mini.statusline").setup()

        -- Mock 'nvim-web-devicons' module
        MiniIcons.mock_nvim_web_devicons()
    end,
}
