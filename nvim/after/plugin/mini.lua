-- User interface
require("mini.icons").setup()
require("mini.statusline").setup()

-- Session management
require("mini.sessions").setup()
require("mini.starter").setup()

-- Text editing
require("mini.ai").setup()
require("mini.align").setup()
require("mini.pairs").setup()
require("mini.splitjoin").setup()
require("mini.surround").setup()

local keymap = {
    { "<leader>qs", function() MiniSessions.select() end,                      "Select session" },
    { "<leader>qw", function() MiniSessions.write(vim.fn.input("Name: ")) end, "Create session" },
    { "<leader>qd", function() MiniSessions.select("delete") end,              "Delete session" },
}

for _, mapping in pairs(keymap) do
    local lhs  = mapping[1]
    local rhs  = mapping[2]

    local opts = {
        desc = mapping[3],
    }

    vim.keymap.set("n", lhs, rhs, opts)
end
