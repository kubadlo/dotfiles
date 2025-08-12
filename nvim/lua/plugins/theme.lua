return {
    "folke/tokyonight.nvim",
    priority = 1000,
    lazy = false,
    ---@type tokyonight.Config
    ---@diagnostic disable-next-line: missing-fields
    opts = {
        style = "moon",
        styles = {
            keywords = {
                bold = true,
                italic = false,
            },
        },
    },
    ---@param opts tokyonight.Config
    config = function(_, opts)
        require("tokyonight").setup(opts)
        vim.cmd.colorscheme("tokyonight")
    end,
}
