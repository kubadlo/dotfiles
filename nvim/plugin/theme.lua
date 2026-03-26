local add, now = MiniDeps.add, MiniDeps.now

now(function()
    add({
        source = "catppuccin/nvim",
        name = "catppuccin",
    })

    require("catppuccin").setup({
        flavour = "macchiato",
        float = {
            transparent = true,
            solid       = false,
        },
        styles = {
            conditionals = {},
            keywords     = { "bold" },
            misc         = {},
        },
        ---@type CtpHighlightOverrideFn
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
            }
        end,
    })

    vim.cmd("colorscheme catppuccin")
end)
