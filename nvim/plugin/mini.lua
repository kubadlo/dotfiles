-- User interface
require("mini.icons").setup()
require("mini.statusline").setup()
require("mini.tabline").setup({
    tabpage_section = 'right',
})

-- Session management
require("mini.sessions").setup()
require("mini.starter").setup()

-- File explorer
require("mini.files").setup({
    mappings = {
        go_in = "<cr>",
        go_out = "<left>"
    },
    windows = {
        width_focus   = 40,
        width_nofocus = 40,
    },
})

-- Pickers
require("mini.extra").setup()
require("mini.pick").setup({
    window = {
        config = function()
            local height = math.floor(0.618 * vim.o.lines)
            local width  = math.floor(0.618 * vim.o.columns)

            local row    = math.floor(0.5 * (vim.o.lines - height))
            local col    = math.floor(0.5 * (vim.o.columns - width))

            return {
                anchor = 'NW',
                height = height,
                width = width,
                row = row,
                col = col,
            }
        end
    },
})

-- Git
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

-- General workflow
require("mini.bracketed").setup()
require("mini.bufremove").setup()

-- Autocomplete
require("mini.cmdline").setup()
require("mini.completion").setup()

-- Text editing
require("mini.ai").setup()
require("mini.align").setup()
require("mini.pairs").setup()
require("mini.splitjoin").setup()
require("mini.surround").setup()

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
        { mode = "n", keys = "<leader>w",     desc = "+Workspace" },
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
