return {
    "saghen/blink.cmp",
    version = "1.*",
    event = "InsertEnter",
    ---@type blink.cmp.Config
    opts = {
        completion = {
            ghost_text = {
                enabled = true,
            },
        },
        keymap = {
            preset = "enter",
        },
    },
}
