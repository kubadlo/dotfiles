require("catppuccin").setup({
    flavour = "mocha",
    float = {
        transparent = true,
    },
    styles = {
        conditionals = {},
        keywords     = { "bold" },
    },
    custom_highlights = function(colors)
        return {
            BlinkCmpMenu = {
                bg = colors.base,
            },
            BlinkCmpMenuBorder = {
                bg = colors.base,
                fg = colors.blue,
            },
        }
    end,
})

vim.cmd("colorscheme catppuccin")
