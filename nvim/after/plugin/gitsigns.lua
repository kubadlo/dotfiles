vim.pack.add({
    "https://github.com/lewis6991/gitsigns.nvim",
})

---@type Gitsigns.Config
---@diagnostic disable-next-line: missing-fields
local config = {
    signs = {
        add = {
            text = "▎",
            show_count = false,
        },
        change = {
            text = "▎",
            show_count = false,
        },
        delete = {
            text = "",
            show_count = false,
        },
        topdelete = {
            text = "",
            show_count = false,
        },
        changedelete = {
            text = "▎",
            show_count = false,
        },
        untracked = {
            text = "▎",
            show_count = false,
        },
    },
    signs_staged = {
        add = {
            text = "▎",
            show_count = false,
        },
        change = {
            text = "▎",
            show_count = false,
        },
        delete = {
            text = "",
            show_count = false,
        },
        topdelete = {
            text = "",
            show_count = false,
        },
        changedelete = {
            text = "▎",
            show_count = false,
        },
    },
    current_line_blame = true,
    on_attach = function(bufnr)
        local gitsigns = require("gitsigns")
        local mappings = {
            -- Navigation
            { "[h",         function() gitsigns.nav_hunk("prev") end, "Previous hunk" },
            { "]h",         function() gitsigns.nav_hunk("next") end, "Next hunk" },
            -- Actions
            { "<leader>hs", gitsigns.stage_hunk,                      "Stage hunk",   { "n", "x" } },
            { "<leader>hS", gitsigns.stage_buffer,                    "Stage buffer", },
            { "<leader>hr", gitsigns.reset_hunk,                      "Reset hunk",   { "n", "x" } },
            { "<leader>hR", gitsigns.reset_buffer,                    "Reset buffer", },
        }

        for _, mapping in pairs(mappings) do
            vim.keymap.set(mapping[4] or "n", mapping[1], mapping[2], { desc = mapping[3], buf = bufnr })
        end
    end
}

require("gitsigns").setup(config)
