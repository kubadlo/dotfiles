return {
    "folke/snacks.nvim",
    lazy = false,
    priority = 1000,
    keys = {
        -- Find files
        { "<leader>e",  function() Snacks.explorer() end,                     desc = "File explorer" },
        { "<leader>ff", function() Snacks.picker.files() end,                 desc = "Find files" },
        { "<leader>fb", function() Snacks.picker.buffers() end,               desc = "Buffers" },
        { "<leader>fr", function() Snacks.picker.recent() end,                desc = "Recent" },
        -- Search in files
        { "<leader>sb", function() Snacks.picker.lines() end,                 desc = "Buffer lines" },
        { "<leader>sB", function() Snacks.picker.grep_buffers() end,          desc = "Search in buffers" },
        { "<leader>sg", function() Snacks.picker.grep() end,                  desc = "Grep" },
        { "<leader>sr", function() Snacks.picker.registers() end,             desc = "Registers" },
        -- Buffers
        { "<leader>bd", function() Snacks.bufdelete() end,                    desc = "Delete buffer" },
        { "<leader>bo", function() Snacks.bufdelete.other() end,              desc = "Delete other buffers" },
        -- Git
        { "<leader>gg", function() Snacks.lazygit.open() end,                 desc = "Lazygit" },
        { "<leader>gb", function() Snacks.picker.git_branches() end,          desc = "Git Branches" },
        { "<leader>gl", function() Snacks.picker.git_log() end,               desc = "Git Log" },
        { "<leader>gL", function() Snacks.picker.git_log_line() end,          desc = "Git Log Line" },
        { "<leader>gs", function() Snacks.picker.git_status() end,            desc = "Git Status" },
        { "<leader>gS", function() Snacks.picker.git_stash() end,             desc = "Git Stash" },
        { "<leader>gd", function() Snacks.picker.git_diff() end,              desc = "Git Diff (Hunks)" },
        -- LSP
        { "gd",         function() Snacks.picker.lsp_definitions() end,       desc = "Go to definition" },
        { "gD",         function() Snacks.picker.lsp_declarations() end,      desc = "Go to declaration" },
        { "gr",         function() Snacks.picker.lsp_references() end,        desc = "References" },
        { "gI",         function() Snacks.picker.lsp_implementations() end,   desc = "Go to implementation" },
        { "gy",         function() Snacks.picker.lsp_type_definitions() end,  desc = "Go to type definition" },
        { "<leader>cs", function() Snacks.picker.lsp_symbols() end,           desc = "Document symbols" },
        { "<leader>cS", function() Snacks.picker.lsp_workspace_symbols() end, desc = "Workspace symbols" },
        { "<leader>cd", function() Snacks.picker.diagnostics_buffer() end,    desc = "Document diagnostics" },
        { "<leader>cD", function() Snacks.picker.diagnostics() end,           desc = "Workspace diagnostics" },
    },
    opts = {
        explorer = {
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
        terminal = {
            enabled = true,
        },
    },
}
