vim.pack.add({
    "https://github.com/folke/snacks.nvim",
})

---@type snacks.Config
local config = {
    explorer  = { enabled = true },
    image     = { enabled = true },
    input     = { enabled = true },
    notifier  = { enabled = true },
    picker    = {
        enabled = true,
        sources = {
            loclist = {
                layout = {
                    preset = 'ivy',
                },
            },
            qflist = {
                layout = {
                    preset = 'ivy',
                },
            }
        },
    },
    quickfile = { enabled = true },
    words     = { enabled = true },
}

local keymap = {
    --- Files
    { "<leader><space>", function() Snacks.picker.files() end,                 "Find files" },
    { "<leader>,",       function() Snacks.picker.buffers() end,               "Find buffers" },
    { "<leader>.",       function() Snacks.picker.resume() end,                "Resume last picker" },
    { "<leader>/",       function() Snacks.picker.grep() end,                  "Find in files" },
    { "<leader>e",       function() Snacks.explorer() end,                     "File explorer" },
    --- Buffers
    { "<leader>bd",      function() Snacks.bufdelete.delete() end,             "Delete buffer" },
    { "<leader>ba",      function() Snacks.bufdelete.all() end,                "Delete all buffers" },
    { "<leader>bo",      function() Snacks.bufdelete.other() end,              "Delete other buffers" },
    --- Git
    { "<leader>gg",      function() Snacks.lazygit() end,                      "Lazygit" },
    { "<leader>gB",      function() Snacks.gitbrowse() end,                    "Browse remote" },
    { "<leader>gb",      function() Snacks.picker.git_branches() end,          "Branches" },
    { "<leader>gd",      function() Snacks.picker.git_diff() end,              "Diff" },
    { "<leader>gl",      function() Snacks.picker.git_log() end,               "Log" },
    { "<leader>gL",      function() Snacks.picker.git_log_line() end,          "Log Line" },
    { "<leader>gf",      function() Snacks.picker.git_log_file() end,          "Log File" },
    { "<leader>gs",      function() Snacks.picker.git_status() end,            "Status" },
    { "<leader>gS",      function() Snacks.picker.git_stash() end,             "Stash" },
    --- LSP
    { "gd",              function() Snacks.picker.lsp_definitions() end,       "Go to definition" },
    { "gD",              function() Snacks.picker.lsp_declarations() end,      "Go to declaration" },
    { "gr",              function() Snacks.picker.lsp_references() end,        "Find references",      { nowait = true } },
    { "gI",              function() Snacks.picker.lsp_implementations() end,   "Go to implementation" },
    { "gy",              function() Snacks.picker.lsp_type_definitions() end,  "Go to type definition" },
    { "gai",             function() Snacks.picker.lsp_incoming_calls() end,    "Incoming calls" },
    { "gao",             function() Snacks.picker.lsp_outgoing_calls() end,    "Outgoing calls" },
    { "<leader>cs",      function() Snacks.picker.lsp_symbols() end,           "Document symbols" },
    { "<leader>cS",      function() Snacks.picker.lsp_workspace_symbols() end, "Workspace symbols" },
    --- Diagnostics
    { "<leader>cd",      function() Snacks.picker.diagnostics_buffer() end,    "Document diagnostics" },
    { "<leader>cD",      function() Snacks.picker.diagnostics() end,           "Workspace diagnostics" },
    --- Search
    { "<leader>sc",      function() Snacks.picker.commands() end,              "Commands" },
    { "<leader>sh",      function() Snacks.picker.help() end,                  "Help" },
    { "<leader>si",      function() Snacks.picker.icons() end,                 "Icons" },
    { "<leader>sj",      function() Snacks.picker.jumps() end,                 "Jumps" },
    { "<leader>sk",      function() Snacks.picker.keymaps() end,               "Keymaps" },
    { "<leader>sl",      function() Snacks.picker.loclist() end,               "Location list" },
    { "<leader>sm",      function() Snacks.picker.marks() end,                 "Marks" },
    { "<leader>sq",      function() Snacks.picker.qflist() end,                "Quickfix list" },
    { "<leader>sr",      function() Snacks.picker.registers() end,             "Registers" },
    { "<leader>su",      function() Snacks.picker.undo() end,                  "Undo history" },
    --- Words
    { "]]",              function() Snacks.words.jump(vim.v.count1) end,       "Next reference" },
    { "[[",              function() Snacks.words.jump(-vim.v.count1) end,      "Prev reference" },
}

require("snacks").setup(config)

for _, mapping in pairs(keymap) do
    local lhs  = mapping[1]
    local rhs  = mapping[2]
    local opts = vim.tbl_extend("force", mapping[4] or {}, { desc = mapping[3] })

    vim.keymap.set("n", lhs, rhs, opts)
end
