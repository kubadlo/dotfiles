return {
    "lewis6991/gitsigns.nvim",
    event = "BufEnter",
    ---@type Gitsigns.Config
    ---@diagnostic disable-next-line: missing-fields
    opts = {
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
            local gitsigns = require('gitsigns')

            ---@param mode string Mode "short-name".
            ---@param lhs string Left-hand side |{lhs}| of the mapping.
            ---@param rhs function Right-hand side |{rhs}| of the mapping.
            ---@param description string Mapping description.
            local function map(mode, lhs, rhs, description)
                vim.keymap.set(mode, lhs, rhs, {
                    buffer = bufnr,
                    desc = description,
                })
            end

            local function visual_stage()
                gitsigns.stage_hunk({ vim.fn.line('.'), vim.fn.line('v') })
            end

            local function visual_reset()
                gitsigns.reset_hunk({ vim.fn.line('.'), vim.fn.line('v') })
            end

            local function blame_line()
                gitsigns.blame_line({ full = true })
            end

            -- Hunk actions
            map('n', '<leader>hs', gitsigns.stage_hunk, "Stage hunk")
            map('n', '<leader>hr', gitsigns.reset_hunk, "Reset hunk")
            map('v', '<leader>hs', visual_stage, "Stage hunk")
            map('v', '<leader>hr', visual_reset, "Reset hunk")

            -- Buffer actions
            map('n', '<leader>hS', gitsigns.stage_buffer, "Stage buffer")
            map('n', '<leader>hR', gitsigns.reset_buffer, "Reset buffer")
            map('n', '<leader>hp', gitsigns.preview_hunk, "Preview hunk")
            map('n', '<leader>hi', gitsigns.preview_hunk_inline, "Preview hunk inline")

            -- Diffs
            map('n', '<leader>hd', gitsigns.diffthis, "Diff buffer")
            map('n', '<leader>hb', blame_line, "Blame line")
        end,
    },
}
