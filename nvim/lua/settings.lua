-- Show line numbers relative to the cursor position
vim.opt.number = true
vim.opt.relativenumber = true

-- Make <Tab> 4 spaces wide
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

-- Make splits more consistent
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Set intendation based on file defaults
vim.opt.smartindent = true
vim.opt.breakindent = true

-- Set case insensitive search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Show search results while typing
vim.opt.incsearch = true

-- Show whitespace characters
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Start scrolling 5 lines before window edge
vim.opt.scrolloff = 5
vim.opt.sidescrolloff = 5

-- Decrease update time
vim.opt.updatetime = 250

-- Set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- Show current file name in terminal title
vim.opt.title = true

-- Confirm changes before exiting modified buffer
vim.opt.confirm = true

-- Hide mode since it's visible in statusbar
vim.opt.showmode = false

-- Show diagnostics inline
vim.diagnostic.config({
    virtual_text = true,
})
