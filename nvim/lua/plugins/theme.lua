return {
    "folke/tokyonight.nvim",
    priority = 1000,
    lazy = false,
    ---@type tokyonight.Config
    opts = {
        style = "moon",
        styles = {
            keywords = {
                bold = true,
                italic = false,
            },
        },
        on_colors = function() end,
        on_highlights = function() end,
    },
    ---@param opts tokyonight.Config
    config = function(_, opts)
        require("tokyonight").setup(opts)
        vim.cmd.colorscheme("tokyonight")
    end,
}
