vim.pack.add({
    {
        src     = "https://github.com/saghen/blink.cmp",
        version = vim.version.range('1.x')
    },
})

---@type blink.cmp.Config
local config = {
    completion = {
        documentation = {
            auto_show = true,
        },
        ghost_text = {
            enabled = true,
        },
    },
    keymap = {
        preset = "enter",
    },
}

require("blink.cmp").setup(config)
