local now, later = MiniDeps.now, MiniDeps.later

now(function()
    -- Appearance
    require("mini.icons").setup()
    require("mini.statusline").setup()
    require("mini.tabline").setup()

    -- Sessions
    require("mini.sessions").setup()
    require("mini.starter").setup()
end)

later(function()
    -- File management
    require("mini.extra").setup()
    require("mini.files").setup()
    require("mini.pick").setup()

    -- General workflow
    require("mini.bracketed").setup()
    require("mini.bufremove").setup()

    -- Git integration
    require("mini.git").setup()
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

    -- Text editing
    require("mini.ai").setup()
    require("mini.align").setup()
    require("mini.comment").setup()
    require("mini.move").setup()
    require("mini.pairs").setup()
    require("mini.splitjoin").setup()
    require("mini.surround").setup()

    -- Text navigation
    require("mini.jump").setup()
    require("mini.jump2d").setup()

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

    -- Replace default select UI
    vim.ui.select = MiniPick.ui_select
end)
