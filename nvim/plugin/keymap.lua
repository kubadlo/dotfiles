---Returns all listed buffers that can be safely deleted
local function get_listed_buffers()
    local buffers   = vim.api.nvim_list_bufs()
    local predicate = function(buffer)
        return vim.bo[buffer].buflisted
    end

    return vim.tbl_filter(predicate, buffers)
end

---Delete current buffer
local function delete_current_buffer()
    MiniBufremove.delete()
end

---Delete all buffers
local function delete_all_buffers()
    local buffers = get_listed_buffers()

    for _, buf_id in ipairs(buffers) do
        pcall(MiniBufremove.delete, buf_id)
    end
end

---Delete all buffers except the current one
local function delete_other_buffers()
    local current = vim.api.nvim_get_current_buf()
    local buffers = get_listed_buffers()

    for _, buf_id in ipairs(buffers) do
        if buf_id ~= current then
            pcall(MiniBufremove.delete, buf_id)
        end
    end
end

---Open file explorer
local function browse_files()
    local buf_name = vim.api.nvim_buf_get_name(0)
    local buf_mini = string.find(buf_name, "^ministarter")

    if buf_mini ~= nil then
        -- Dashboard is not a valid file buffer. Let's open
        -- the file explorer at the project root.
        MiniFiles.open()
    else
        MiniFiles.open(vim.api.nvim_buf_get_name(0))
    end
end

-- Set <space> as a leader key
vim.g.mapleader = " "

-- Remove conflicting mappings
vim.keymap.del("n", "gra")
vim.keymap.del("x", "gra")
vim.keymap.del("n", "gri")
vim.keymap.del("n", "grn")
vim.keymap.del("n", "grr")
vim.keymap.del("n", "grt")
vim.keymap.del("n", "grx")

-- Find files
vim.keymap.set("n", "<leader><space>", "<cmd>Pick files<cr>", { desc = "Find files" })
vim.keymap.set("n", "<leader>,", "<cmd>Pick buffers<cr>", { desc = "Find buffers" })
vim.keymap.set("n", "<leader>.", "<cmd>Pick resume<cr>", { desc = "Resume last picker" })
vim.keymap.set("n", "<leader>/", "<cmd>Pick grep_live<cr>", { desc = "Find in files" })
vim.keymap.set("n", "<leader>e", browse_files, { desc = "File explorer" })

-- Search
vim.keymap.set("n", "<leader>sc", "<cmd>Pick commands<cr>", { desc = "Commands" })
vim.keymap.set("n", "<leader>sh", "<cmd>Pick help<cr>", { desc = "Help" })
vim.keymap.set("n", "<leader>sk", "<cmd>Pick keymaps<cr>", { desc = "Keymaps" })
vim.keymap.set("n", "<leader>sl", "<cmd>Pick buf_lines scope='current'<cr>", { desc = "Buffer lines" })
vim.keymap.set("n", "<leader>sm", "<cmd>Pick marks<cr>", { desc = "Marks" })
vim.keymap.set("n", "<leader>sr", "<cmd>Pick registers<cr>", { desc = "Registers" })
vim.keymap.set("n", "<leader>st", "<cmd>Pick hipatterns<cr>", { desc = "Todos" })

-- Git
vim.keymap.set("n", "<leader>gs", "<cmd>CodeDiff<cr>", { desc = "Status" })
vim.keymap.set("n", "<leader>gb", "<cmd>Pick git_branches<cr>", { desc = "Branches" })
vim.keymap.set("n", "<leader>gc", "<cmd>Pick git_commits<cr>", { desc = "Commits" })
vim.keymap.set("n", "<leader>gh", "<cmd>Pick git_hunks<cr>", { desc = "Hunks" })

-- Code
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code actions" })
vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename, { desc = "Rename" })
vim.keymap.set("n", "<leader>cd", "<cmd>Pick diagnostic scope='current'<cr>", { desc = "Buffer diagnostics" })
vim.keymap.set("n", "<leader>cs", "<cmd>Pick lsp scope='document_symbol'<cr>", { desc = "Buffer symbols" })

-- Diagnostics
vim.keymap.set("n", "gK", vim.diagnostic.open_float, { desc = "Diagnostics hover" })

-- LSP
vim.keymap.set("n", "gd", "<cmd>Pick lsp scope='definition'<cr>", { desc = "Go to definition" })
vim.keymap.set("n", "gD", "<cmd>Pick lsp scope='declaration'<cr>", { desc = "Go to declaration" })
vim.keymap.set("n", "gr", "<cmd>Pick lsp scope='references'<cr>", { desc = "References" })
vim.keymap.set("n", "gI", "<cmd>Pick lsp scope='implementation'<cr>", { desc = "Go to implementation" })
vim.keymap.set("n", "gy", "<cmd>Pick lsp scope='type_definition'<cr>", { desc = "Go to type definition" })

-- Workspace
vim.keymap.set("n", "<leader>wd", "<cmd>Pick diagnostic scope='all'<cr>", { desc = "Workspace diagnostics" })
vim.keymap.set("n", "<leader>ws", "<cmd>Pick lsp scope='workspace_symbol'<cr>", { desc = "Workspace symbols" })

-- Buffers
vim.keymap.set("n", "<leader>bb", "<cmd>b#<cr>", { desc = "Toggle buffer" })
vim.keymap.set("n", "<leader>bd", delete_current_buffer, { desc = "Delete buffer" })
vim.keymap.set("n", "<leader>ba", delete_all_buffers, { desc = "Delete all buffers" })
vim.keymap.set("n", "<leader>bo", delete_other_buffers, { desc = "Delete other buffers" })

-- Tabs
vim.keymap.set("n", "<leader><tab><tab>", "<cmd>tabnew<cr>", { desc = "New tab" })
vim.keymap.set("n", "<leader><tab>d", "<cmd>tabclose<cr>", { desc = "Close tab" })
vim.keymap.set("n", "<leader><tab>o", "<cmd>tabonly<cr>", { desc = "Close other tabs" })

-- Better indenting
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- Copy/paste with system clipboard
vim.keymap.set("x", "gy", "\"+y", { desc = "Copy to clipboard" })
vim.keymap.set("n", "gp", "\"+p", { desc = "Paste from clipboard" })
vim.keymap.set("x", "gp", "\"+P", { desc = "Paste from clipboard" })

-- Move lines
vim.keymap.set("n", "<A-j>", "<cmd>execute 'move .+' . v:count1<cr>==", { desc = "Move down" })
vim.keymap.set("n", "<A-k>", "<cmd>execute 'move .-' . (v:count1 + 1)<cr>==", { desc = "Move up" })
vim.keymap.set("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move down" })
vim.keymap.set("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move up" })
vim.keymap.set("v", "<A-j>", ":<C-u>execute \"'<,'>move '>+\" . v:count1<cr>gv=gv", { desc = "Move down" })
vim.keymap.set("v", "<A-k>", ":<C-u>execute \"'<,'>move '<-\" . (v:count1 + 1)<cr>gv=gv", { desc = "Move up" })

-- Window navigation
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Focus left window", remap = true })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Focus below window", remap = true })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Focus above window", remap = true })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Focus right window", remap = true })

-- Resize window
vim.keymap.set("n", "<C-S-Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
vim.keymap.set("n", "<C-S-Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
vim.keymap.set("n", "<C-S-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
vim.keymap.set("n", "<C-S-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })
