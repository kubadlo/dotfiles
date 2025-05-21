return {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
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
