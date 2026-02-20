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
            solid = false,
        },
        styles = {
            conditionals = {},
            keywords = { "bold" },
            misc = {},
        },
    })

    vim.cmd("colorscheme catppuccin")
end)
