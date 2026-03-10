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

--- Toggle diff overlay in the current buffer
local function git_diff_toggle()
    MiniDiff.toggle_overlay(vim.api.nvim_get_current_buf())
end

--- Show info about diff or commit under the cursor
local function git_status_toggle()
    MiniGit.show_at_cursor()
end

--- Select a previously started session
local function session_select()
    MiniSessions.select()
end

--- Write a new session
local function session_write()
    MiniSessions.write(vim.fn.input("Session name: "))
end

local function session_delete()
    MiniSessions.select("delete")
end

-- Pick buffers with extra mappings
local function pick_buffers()
    MiniPick.builtin.buffers({}, {
        mappings = {
            delete_buffer = {
                char = "<C-d>",
                func = function()
                    local matches = MiniPick.get_picker_matches()
                    if not matches then
                        return
                    end

                    local current = matches.current
                    if not current then
                        return
                    end

                    -- Delete the selected buffer
                    vim.api.nvim_buf_delete(current.bufnr, { force = false })

                    -- Filter out deleted buffer from the picker items
                    local items = vim.tbl_filter(function(item)
                        return vim.api.nvim_buf_is_valid(item.bufnr)
                    end, MiniPick.get_picker_items() or {})

                    -- Update picker list
                    MiniPick.set_picker_items(items)
                end,
            }
        }
    })
end

local git_log_cmd = [[Git log --pretty=format:\%h\ \%as\ │\ \%s --topo-order]]
local git_log_buf = git_log_cmd .. " --follow -- %"

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
vim.keymap.set("n", "<leader>,", pick_buffers, { desc = "Buffers" })
vim.keymap.set("n", "<leader>/", "<cmd>Pick grep_live<cr>", { desc = "Grep" })

-- Buffers
vim.keymap.set("n", "<leader>bb", "<cmd>b#<cr>", { desc = "Toggle buffer" })
vim.keymap.set("n", "<leader>bd", buffer_delete, { desc = "Delete buffer" })
vim.keymap.set("n", "<leader>ba", buffer_delete_all, { desc = "Delete all buffers" })
vim.keymap.set("n", "<leader>bo", buffer_delete_other, { desc = "Delete other buffers" })

-- Diagnostics
vim.keymap.set("n", "gK", vim.diagnostic.open_float, { desc = "Diagnostics hover" })
vim.keymap.set("n", "<leader>cd", "<cmd>Pick diagnostic scope='current'<cr>", { desc = "Document diagnostics" })
vim.keymap.set("n", "<leader>cD", "<cmd>Pick diagnostic scope='all'<cr>", { desc = "Workspace diagnostics" })

-- LSP
vim.keymap.set("n", "g.", vim.lsp.buf.code_action, { desc = "Code actions" })
vim.keymap.set("n", "gd", "<cmd>Pick lsp scope='definition'<cr>", { desc = "Go to definition" })
vim.keymap.set("n", "gD", "<cmd>Pick lsp scope='declaration'<cr>", { desc = "Go to declaration" })
vim.keymap.set("n", "gr", "<cmd>Pick lsp scope='references'<cr>", { desc = "References" })
vim.keymap.set("n", "gI", "<cmd>Pick lsp scope='implementation'<cr>", { desc = "Go to implementation" })
vim.keymap.set("n", "gy", "<cmd>Pick lsp scope='type_definition'<cr>", { desc = "Go to type definition" })
vim.keymap.set("n", "<leader>cs", "<cmd>Pick lsp scope='document_symbol'<cr>", { desc = "Document symbols" })
vim.keymap.set("n", "<leader>cS", "<cmd>Pick lsp scope='workspace_symbol'<cr>", { desc = "Workspace symbols" })
vim.keymap.set("n", "<leader>cf", vim.lsp.buf.format, { desc = "Format" })
vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename, { desc = "Rename" })

-- Git
vim.keymap.set("n", "<leader>gb", "<cmd>Pick git_branches<cr>", { desc = "Branches" })
vim.keymap.set("n", "<leader>gc", "<cmd>Pick git_commits<cr>", { desc = "Commits" })
vim.keymap.set("n", "<leader>gh", "<cmd>Pick git_hunks<cr>", { desc = "Hunks" })
vim.keymap.set("n", "<leader>gd", "<cmd>Git diff -- %<cr>", { desc = "Diff buffer" })
vim.keymap.set("n", "<leader>gD", "<cmd>Git diff<cr>", { desc = "Diff workspace" })
vim.keymap.set("n", "<leader>gl", "<cmd>" .. git_log_buf .. "<cr>", { desc = "File history" })
vim.keymap.set("n", "<leader>gL", "<cmd>" .. git_log_cmd .. "<cr>", { desc = "Workspace history" })
vim.keymap.set("n", "<leader>gt", git_diff_toggle, { desc = "Toggle diff overlay" })
vim.keymap.set("n", "<leader>gs", git_status_toggle, { desc = "Show at cursor" })

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
vim.keymap.set("x", "gy", "\"+y", { desc = "Copy to system clipboard" })
vim.keymap.set("n", "gp", "\"+p", { desc = "Paste from system clipboard" })
vim.keymap.set("x", "gp", "\"+P", { desc = "Paste from system clipboard" })

-- Cursor navigation
vim.keymap.set("c", "<M-h>", "<Left>", { silent = false, desc = "Left" })
vim.keymap.set("c", "<M-l>", "<Right>", { silent = false, desc = "Right" })

vim.keymap.set("i", "<M-h>", "<Left>", { noremap = false, desc = "Left" })
vim.keymap.set("i", "<M-j>", "<Down>", { noremap = false, desc = "Down" })
vim.keymap.set("i", "<M-k>", "<Up>", { noremap = false, desc = "Up" })
vim.keymap.set("i", "<M-l>", "<Right>", { noremap = false, desc = "Right" })

vim.keymap.set("t", "<M-h>", "<Left>", { desc = "Left" })
vim.keymap.set("t", "<M-j>", "<Down>", { desc = "Down" })
vim.keymap.set("t", "<M-k>", "<Up>", { desc = "Up" })
vim.keymap.set("t", "<M-l>", "<Right>", { desc = "Right" })

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
vim.keymap.set("n", "<leader>qw", session_delete, { desc = "Delete session" })
vim.keymap.set("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit All" })
