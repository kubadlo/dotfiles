return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    keys = {
        -- Find files
        { "<leader><space>", function() Snacks.picker.files() end,                 desc = "Find files" },
        { "<leader>,",       function() Snacks.picker.buffers() end,               desc = "Buffers" },
        { "<leader>/",       function() Snacks.picker.grep() end,                  desc = "Grep" },
        -- File explorer
        { "<leader>e",       function() Snacks.explorer() end,                     desc = "File explorer" },
        -- Buffers
        { "<leader>bd",      function() Snacks.bufdelete.delete() end,             desc = "Delete buffer" },
        { "<leader>ba",      function() Snacks.bufdelete.all() end,                desc = "Delete all buffers" },
        { "<leader>bo",      function() Snacks.bufdelete.other() end,              desc = "Delete other buffers" },
        -- Git
        { "<leader>gg",      function() Snacks.lazygit.open() end,                 desc = "Open lazygit" },
        { "<leader>go",      function() Snacks.gitbrowse.open() end,               desc = "Open the repo in the browser" },
        { "<leader>gb",      function() Snacks.picker.git_branches() end,          desc = "Git branches" },
        { "<leader>gd",      function() Snacks.picker.git_diff() end,              desc = "Git diff" },
        { "<leader>gl",      function() Snacks.picker.git_log() end,               desc = "Git log" },
        { "<leader>gL",      function() Snacks.picker.git_log_line() end,          desc = "Git log line" },
        { "<leader>gf",      function() Snacks.picker.git_log_file() end,          desc = "Git log file" },
        { "<leader>gs",      function() Snacks.picker.git_status() end,            desc = "Git status" },
        { "<leader>gS",      function() Snacks.picker.git_stash() end,             desc = "Git stash" },
        -- LSP
        { "gd",              function() Snacks.picker.lsp_definitions() end,       desc = "Go to definition" },
        { "gD",              function() Snacks.picker.lsp_declarations() end,      desc = "Go to declaration" },
        { "gr",              function() Snacks.picker.lsp_references() end,        desc = "References" },
        { "gI",              function() Snacks.picker.lsp_implementations() end,   desc = "Go to implementation" },
        { "gy",              function() Snacks.picker.lsp_type_definitions() end,  desc = "Go to type definition" },
        { "<leader>cs",      function() Snacks.picker.lsp_symbols() end,           desc = "Document symbols" },
        { "<leader>cS",      function() Snacks.picker.lsp_workspace_symbols() end, desc = "Workspace symbols" },
        -- Diagnostics
        { "<leader>cd",      function() Snacks.picker.diagnostics_buffer() end,    desc = "Document diagnostics" },
        { "<leader>cD",      function() Snacks.picker.diagnostics() end,           desc = "Workspace diagnostics" },
        -- Search
        { "<leader>sb",      function() Snacks.picker.grep_buffers() end,          desc = "Open buffers" },
        { "<leader>si",      function() Snacks.picker.icons() end,                 desc = "Icons" },
        { "<leader>sl",      function() Snacks.picker.lines() end,                 desc = "Buffer lines" },
        { "<leader>sk",      function() Snacks.picker.keymaps() end,               desc = "Keymaps" },
        { "<leader>sr",      function() Snacks.picker.registers() end,             desc = "Registers" },
    },
    opts = {
        bufdelete = {
            enabled = true,
        },
        explorer = {
            enabled = true,
        },
        gitbrowse = {
            enabled = true,
        },
        indent = {
            enabled = true,
        },
        input = {
            enabled = true,
        },
        lazygit = {
            enabled = true,
        },
        notifier = {
            enabled = true,
        },
        picker = {
            enabled = true,
        },
    },
}
