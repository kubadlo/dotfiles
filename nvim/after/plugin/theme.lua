vim.pack.add({
    {
        src  = "https://github.com/catppuccin/nvim",
        name = "catppuccin",
    },
})

---@type CatppuccinOptions
local config = {
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
}

require("catppuccin").setup(config)
vim.cmd("colorscheme catppuccin")
