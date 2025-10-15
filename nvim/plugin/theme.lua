local add, now = MiniDeps.add, MiniDeps.now

now(function()
    add({
        source = "catppuccin/nvim",
        name = "catppuccin",
    })

    require("catppuccin").setup({
        background = {
            dark = "macchiato",
            light = "latte",
        },
        styles = {
            conditionals = {},
            keywords = { "bold" },
        },
    })

    vim.cmd("colorscheme catppuccin")
end)
