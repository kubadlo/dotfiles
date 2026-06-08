require("catppuccin").setup({
    flavour = "macchiato",
    float = {
        transparent = true,
    },
    styles = {
        conditionals = {},
        keywords     = { "bold" },
    },
    custom_highlights = function(colors)
        return {
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
            Pmenu = {
                bg = colors.base,
            },
            PmenuBorder = {
                bg = colors.base,
                fg = colors.blue,
            },
        }
    end
})

vim.cmd("colorscheme catppuccin")
