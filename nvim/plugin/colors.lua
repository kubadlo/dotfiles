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
            MiniTablineCurrent = {
                style = { "bold" },
            },
            MiniTablineModifiedCurrent = {
                fg = colors.peach,
                style = { "bold" },
            },
            MiniTablineModifiedVisible = {
                fg = colors.peach,
            },
            MiniTablineModifiedHidden = {
                fg = colors.peach,
            },
            MiniTablineFill = {
                bg = colors.mantle,
            },
            MiniTablineTabpagesection = {
                fg = colors.base,
                bg = colors.blue,
                style = { "bold" },
            },
        }
    end,
})

vim.cmd("colorscheme catppuccin")
