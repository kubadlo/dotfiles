-- Show line numbers relative to the cursor position
vim.opt.number = true
vim.opt.relativenumber = true

-- Highlight the current line
vim.opt.cursorline = true

-- Make <Tab> 4 spaces wide
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true

-- Set indentation based on file defaults
vim.opt.smartindent = true
vim.opt.breakindent = true

-- Set case insensitive search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Show search results while typing
vim.opt.incsearch = true

-- Enable persistent undo
vim.opt.undofile = true

-- Disable word wrapping
vim.opt.wrap = false

-- Show whitespace characters
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- Make splits more consistent
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Start scrolling 5 lines before window edge
vim.opt.scrolloff = 5
vim.opt.sidescrolloff = 5

-- Always show signcolumn (less flicker)
vim.opt.signcolumn = "yes"

-- Hide mode since it's visible in status bar
vim.opt.showmode = false

-- Use one global status bar per Neovim instance
vim.opt.laststatus = 3

-- Show current filename in terminal title
vim.opt.title = true

-- Confirm changes before exiting modified buffer
vim.opt.confirm = true

-- Show diagnostics inline
vim.diagnostic.config({
    virtual_text = true,
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = "",
            [vim.diagnostic.severity.WARN] = "",
            [vim.diagnostic.severity.HINT] = "",
            [vim.diagnostic.severity.INFO] = "",
        },
    }
})
