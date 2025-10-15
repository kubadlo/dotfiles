local now, later = MiniDeps.now, MiniDeps.later

now(function()
    require("mini.basics").setup({
        options = {
            extra_ui = true,
        },
        mappings = {
            windows = true,
            move_with_alt = true,
        },
    })
end)

-- Appearance
now(function() require("mini.statusline").setup() end)
now(function()
    require("mini.icons").setup()

    -- Mock "nvim-web-devicons" module
    MiniIcons.mock_nvim_web_devicons()
end)

-- Sessions
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
later(function() require("mini.bufremove").setup() end)
later(function() require("mini.jump").setup() end)
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

-- Git integration
later(function() require("mini.diff").setup() end)
later(function() require("mini.git").setup() end)

-- Text editing
later(function() require("mini.ai").setup() end)
later(function() require("mini.align").setup() end)
later(function() require("mini.comment").setup() end)
later(function() require("mini.move").setup() end)
later(function() require("mini.pairs").setup() end)
later(function() require("mini.splitjoin").setup() end)
later(function() require("mini.surround").setup() end)
later(function()
    require("mini.completion").setup({
        fallback_action = function() end,
    })
end)
