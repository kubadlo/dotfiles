return {
    "folke/tokyonight.nvim",
    priority = 1000,
    lazy = false,
    opts = {
        style = "moon",
        styles = {
            keywords = {
                bold = true,
                italic = false,
            },
        },
    },
    config = function(_, opts)
        require("tokyonight").setup(opts)
        vim.cmd.colorscheme("tokyonight")
    end,
}
