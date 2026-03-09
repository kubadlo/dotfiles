local now, later = MiniDeps.now, MiniDeps.later

-- User interface
now(function() require("mini.icons").setup() end)
now(function() require("mini.statusline").setup() end)

-- Session management
now(function() require("mini.sessions").setup() end)
now(function() require("mini.starter").setup() end)

-- File management
later(function() require("mini.extra").setup() end)
later(function()
    require("mini.files").setup({
        windows = {
            width_focus = 40,
            width_nofocus = 40,
        },
    })
end)

later(function()
    require("mini.pick").setup({
        window = {
            config = function()
                local height = math.floor(0.618 * vim.o.lines)
                local width = math.floor(0.618 * vim.o.columns)

                return {
                    anchor = "NW",
                    height = height,
                    width = width,
                    row = math.floor(0.5 * (vim.o.lines - height)),
                    col = math.floor(0.5 * (vim.o.columns - width)),
                }
            end,
        },
    })
end)

-- General workflow
later(function() require("mini.bracketed").setup() end)
later(function() require("mini.bufremove").setup() end)

-- Git integration
later(function() require("mini.git").setup() end)
later(function()
    require("mini.diff").setup({
        view = {
            style = "sign",
            signs = {
                add = "▎",
                change = "▎",
                delete = "",
            },
        },
    })
end)

-- Text editing
later(function() require("mini.ai").setup() end)
later(function() require("mini.align").setup() end)
later(function() require("mini.comment").setup() end)
later(function() require("mini.move").setup() end)
later(function() require("mini.pairs").setup() end)
later(function() require("mini.splitjoin").setup() end)
later(function() require("mini.surround").setup() end)

-- Text navigation
later(function() require("mini.jump").setup() end)
later(function() require("mini.jump2d").setup() end)

later(function()
    local clue = require("mini.clue")
    clue.setup({
        triggers = {
            -- Leader triggers
            { mode = { "n", "x" }, keys = "<leader>" },

            -- Built-in completion
            { mode = "i",          keys = "<C-x>" },

            -- Window commands
            { mode = "n",          keys = "<C-w>" },

            -- Square brackets
            { mode = { "n", "x" }, keys = "[" },
            { mode = { "n", "x" }, keys = "]" },

            -- Marks
            { mode = { "n", "x" }, keys = "'" },
            { mode = { "n", "x" }, keys = "`" },

            -- Registers
            { mode = { "n", "x" }, keys = '"' },
            { mode = { "i", "c" }, keys = "<C-r>" },

            -- Surround
            { mode = { "n", "x" }, keys = "s" },

            -- "g" key
            { mode = { "n", "x" }, keys = "g" },

            -- "z" key
            { mode = { "n", "x" }, keys = "z" },
        },
        clues = {
            { mode = "n", keys = "<leader><tab>", desc = "+Tabs" },
            { mode = "n", keys = "<leader>b",     desc = "+Buffers" },
            { mode = "n", keys = "<leader>c",     desc = "+Code" },
            { mode = "n", keys = "<leader>g",     desc = "+Git" },
            { mode = "n", keys = "<leader>q",     desc = "+Sessions" },
            { mode = "n", keys = "<leader>s",     desc = "+Search" },
            clue.gen_clues.builtin_completion(),
            clue.gen_clues.g(),
            clue.gen_clues.marks(),
            clue.gen_clues.registers(),
            clue.gen_clues.square_brackets(),
            clue.gen_clues.windows(),
            clue.gen_clues.z(),
        },
        window = {
            delay = 250,
        },
    })
end)

later(function()
    local hipatterns = require("mini.hipatterns")
    hipatterns.setup({
        highlighters = {
            -- Highlight standalone "FIXME", "HACK", "TODO", "NOTE"
            fixme = {
                pattern = "%f[%w]()FIXME()%f[%W]",
                group = "MiniHipatternsFixme"
            },
            hack = {
                pattern = "%f[%w]()HACK()%f[%W]",
                group = "MiniHipatternsHack"
            },
            todo = {
                pattern = "%f[%w]()TODO()%f[%W]",
                group = "MiniHipatternsTodo"
            },
            note = {
                pattern = "%f[%w]()NOTE()%f[%W]",
                group = "MiniHipatternsNote"
            },
            -- Highlight hex color strings (`#aabbcc`) using that color
            hex_color = hipatterns.gen_highlighter.hex_color(),
        },
    })
end)

later(function()
    -- Mock icons for plugins that does not support mini.icons
    MiniIcons.mock_nvim_web_devicons()

    -- Add icons for LSP types
    MiniIcons.tweak_lsp_kind()

    -- Replace default select UI
    vim.ui.select = MiniPick.ui_select
end)
