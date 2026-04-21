-- Set <space> as a leader key
vim.g.mapleader = " "

local keymap = {
    -- Better indenting
    { "v", "<",                  "<gv" },
    { "v", ">",                  ">gv" },
    -- Buffers
    { "n", "<leader>bb",         "<cmd>b#<cr>",                                               "Toggle buffer" },
    -- Diagnostics
    { "n", "gK",                 vim.diagnostic.open_float,                                   "Diagnostics hover" },
    -- Copy/paste with system clipboard
    { "x", "gy",                 "\"+y",                                                      "Copy to clipboard" },
    { "n", "gp",                 "\"+p",                                                      "Paste from clipboard" },
    { "x", "gp",                 "\"+P",                                                      "Paste from clipboard" },
    -- LSP
    { "n", "g.",                 vim.lsp.buf.code_action,                                     "Code actions" },
    { "n", "<leader>cr",         vim.lsp.buf.rename,                                          "Rename" },
    -- Move lines
    { "n", "<A-j>",              "<cmd>execute 'move .+' . v:count1<cr>==",                   "Move down" },
    { "n", "<A-k>",              "<cmd>execute 'move .-' . (v:count1 + 1)<cr>==",             "Move up" },
    { "i", "<A-j>",              "<esc><cmd>m .+1<cr>==gi",                                   "Move down" },
    { "i", "<A-k>",              "<esc><cmd>m .-2<cr>==gi",                                   "Move up" },
    { "v", "<A-j>",              ":<C-u>execute \"'<,'>move '>+\" . v:count1<cr>gv=gv",       "Move down" },
    { "v", "<A-k>",              ":<C-u>execute \"'<,'>move '<-\" . (v:count1 + 1)<cr>gv=gv", "Move up" },
    -- Window navigation
    { "n", "<C-h>",              "<C-w>h",                                                    "Focus left window",     { remap = true } },
    { "n", "<C-j>",              "<C-w>j",                                                    "Focus below window",    { remap = true } },
    { "n", "<C-k>",              "<C-w>k",                                                    "Focus above window",    { remap = true } },
    { "n", "<C-l>",              "<C-w>l",                                                    "Focus right window",    { remap = true } },
    -- Resize window
    { "n", "<C-S-Up>",           "<cmd>resize +2<cr>",                                        "Increase window height" },
    { "n", "<C-S-Down>",         "<cmd>resize -2<cr>",                                        "Decrease window height" },
    { "n", "<C-S-Left>",         "<cmd>vertical resize -2<cr>",                               "Decrease window width" },
    { "n", "<C-S-Right>",        "<cmd>vertical resize +2<cr>",                               "Increase window width" },
    -- Tab management
    { "n", "<leader><tab><tab>", "<cmd>tabnew<cr>",                                           "New tab" },
    { "n", "<leader><tab>d",     "<cmd>tabclose<cr>",                                         "Close tab" },
    { "n", "<leader><tab>o",     "<cmd>tabonly<cr>",                                          "Close other tabs" },
}

for _, mapping in pairs(keymap) do
    local lhs  = mapping[2]
    local rhs  = mapping[3]

    local mode = mapping[1]
    local opts = vim.tbl_extend("force", mapping[5] or {}, { desc = mapping[4] })

    vim.keymap.set(mode, lhs, rhs, opts)
end
