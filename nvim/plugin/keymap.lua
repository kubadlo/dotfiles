--- Open file explorer at current working directory
local function explore_at_root() MiniFiles.open() end

--- Open file explorer at current buffer path
local function explore_at_file() MiniFiles.open(vim.api.nvim_buf_get_name(0)) end

--- Delete current buffer
local function buffer_delete()
    MiniBufremove.delete()
end

--- Delete all buffers
local function buffer_delete_all()
    local buffers = vim.api.nvim_list_bufs()
    for _, buf_id in ipairs(buffers) do
        pcall(MiniBufremove.delete, buf_id)
    end
end

--- Delete all buffers except the current one
local function buffer_delete_other()
    local current = vim.api.nvim_get_current_buf()
    local buffers = vim.api.nvim_list_bufs()

    for _, buf_id in ipairs(buffers) do
        if buf_id ~= current then
            pcall(MiniBufremove.delete, buf_id)
        end
    end
end

--- Select a previously started session
local function session_select()
    MiniSessions.select()
end

--- Write a new session
local function session_write()
    MiniSessions.write(vim.fn.input("Session name: "))
end

-- Set <space> as a leader key
vim.g.mapleader = " "

-- Remove conflicting keymaps
vim.keymap.del("n", "gra")
vim.keymap.del("n", "gri")
vim.keymap.del("n", "grn")
vim.keymap.del("n", "grr")
vim.keymap.del("n", "grt")
vim.keymap.del("x", "gra")

-- File management
vim.keymap.set("n", "<leader>e", explore_at_file, { desc = "File directory" })
vim.keymap.set("n", "<leader>E", explore_at_root, { desc = "Root directory" })

-- Find files
vim.keymap.set("n", "<leader><space>", "<cmd>Pick files<cr>", { desc = "Files" })
vim.keymap.set("n", "<leader>,", "<cmd>Pick buffers<cr>", { desc = "Buffers" })
vim.keymap.set("n", "<leader>/", "<cmd>Pick grep_live<cr>", { desc = "Grep" })

-- Buffers
vim.keymap.set("n", "<leader>bd", buffer_delete, { desc = "Delete buffer" })
vim.keymap.set("n", "<leader>ba", buffer_delete_all, { desc = "Delete all buffers" })
vim.keymap.set("n", "<leader>bo", buffer_delete_other, { desc = "Delete other buffers" })

-- Diagnostics
vim.keymap.set("n", "gK", vim.diagnostic.open_float, { desc = "Diagnostics hover" })
vim.keymap.set("n", "<leader>cd", "<cmd>Pick diagnostic scope='current'<cr>", { desc = "Document diagnostics" })
vim.keymap.set("n", "<leader>cD", "<cmd>Pick diagnostic scope='all'<cr>", { desc = "Workspace diagnostics" })

-- LSP
vim.keymap.set("n", "gd", "<cmd>Pick lsp scope='definition'<cr>", { desc = "Go to definition" })
vim.keymap.set("n", "gD", "<cmd>Pick lsp scope='declaration'<cr>", { desc = "Go to declaration" })
vim.keymap.set("n", "gr", "<cmd>Pick lsp scope='references'<cr>", { desc = "References" })
vim.keymap.set("n", "gI", "<cmd>Pick lsp scope='implementation'<cr>", { desc = "Go to implementation" })
vim.keymap.set("n", "gy", "<cmd>Pick lsp scope='type_definition'<cr>", { desc = "Go to type definition" })
vim.keymap.set("n", "<leader>cs", "<cmd>Pick lsp scope='document_symbol'<cr>", { desc = "Document symbols" })
vim.keymap.set("n", "<leader>cS", "<cmd>Pick lsp scope='workspace_symbol'<cr>", { desc = "Workspace symbols" })
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code actions" })
vim.keymap.set("n", "<leader>cf", vim.lsp.buf.format, { desc = "Format" })
vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename, { desc = "Rename" })

-- Search
vim.keymap.set("n", "<leader>sc", "<cmd>Pick commands<cr>", { desc = "Commands" })
vim.keymap.set("n", "<leader>sh", "<cmd>Pick help<cr>", { desc = "Help" })
vim.keymap.set("n", "<leader>sk", "<cmd>Pick keymaps<cr>", { desc = "Keymaps" })
vim.keymap.set("n", "<leader>sl", "<cmd>Pick buf_lines scope='current'<cr>", { desc = "Buffer lines" })
vim.keymap.set("n", "<leader>sm", "<cmd>Pick marks<cr>", { desc = "Marks" })
vim.keymap.set("n", "<leader>sr", "<cmd>Pick registers<cr>", { desc = "Registers" })
vim.keymap.set("n", "<leader>st", "<cmd>Pick hipatterns<cr>", { desc = "Todos" })

-- Better indenting
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- Copy/paste with system clipboard
vim.keymap.set({ "n", "x" }, "<leader>y", "\"+y", { desc = "Copy to system clipboard" })
vim.keymap.set("n", "<leader>p", "\"+p", { desc = "Paste from system clipboard" })
vim.keymap.set("x", "<leader>p", "\"+P", { desc = "Paste from system clipboard" })

-- Window navigation
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Focus left window", remap = true })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Focus below window", remap = true })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Focus above window", remap = true })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Focus right window", remap = true })

-- Tab management
vim.keymap.set("n", "<leader><tab><tab>", "<cmd>tabnew<cr>", { desc = "New tab" })
vim.keymap.set("n", "<leader><tab>d", "<cmd>tabclose<cr>", { desc = "Close tab" })
vim.keymap.set("n", "<leader><tab>o", "<cmd>tabonly<cr>", { desc = "Close other tabs" })

-- Session management
vim.keymap.set("n", "<leader>qs", session_select, { desc = "Select session" })
vim.keymap.set("n", "<leader>qw", session_write, { desc = "Write session" })
vim.keymap.set("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit All" })
