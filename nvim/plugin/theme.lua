local add, now = MiniDeps.add, MiniDeps.now

now(function()
    add({ source = "folke/tokyonight.nvim" })

    require("tokyonight").setup({
        style = "moon",
        styles = {
            keywords = {
                bold = true,
                italic = false,
            },
        },
    })

    vim.cmd("colorscheme tokyonight")
end)
