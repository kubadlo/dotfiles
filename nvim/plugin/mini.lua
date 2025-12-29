local now, later = MiniDeps.now, MiniDeps.later

-- User interface
now(function() require("mini.icons").setup() end)
now(function() require("mini.notify").setup() end)
now(function() require("mini.statusline").setup() end)
now(function() require("mini.tabline").setup() end)

-- Session management
now(function() require("mini.sessions").setup() end)
now(function() require("mini.starter").setup() end)

-- File management
later(function() require("mini.extra").setup() end)
later(function() require("mini.files").setup() end)
later(function()
    require("mini.pick").setup()

    -- Replace default select UI
    vim.ui.select = MiniPick.ui_select
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
            { mode = 'n', keys = '<leader>' },
            { mode = 'x', keys = '<leader>' },

            -- Built-in completion
            { mode = 'i', keys = '<C-x>' },

            -- "g" key
            { mode = 'n', keys = 'g' },
            { mode = 'x', keys = 'g' },

            -- Marks
            { mode = 'n', keys = "'" },
            { mode = 'n', keys = '`' },
            { mode = 'x', keys = "'" },
            { mode = 'x', keys = '`' },

            -- Registers
            { mode = 'n', keys = '"' },
            { mode = 'x', keys = '"' },
            { mode = 'i', keys = '<C-r>' },
            { mode = 'c', keys = '<C-r>' },

            -- Window commands
            { mode = 'n', keys = '<C-w>' },

            -- "z" key
            { mode = 'n', keys = 'z' },
            { mode = 'x', keys = 'z' },
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
