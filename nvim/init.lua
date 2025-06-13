require("core.config")
require("core.keymap")

local data_path = vim.fn.stdpath("data")

local lazy_path = data_path .. "/lazy/lazy.nvim"
local lazy_repo = "https://github.com/folke/lazy.nvim.git"

-- Install lazy.nvim if it's not already installed
if not (vim.uv or vim.loop).fs_stat(lazy_path) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "--branch=stable",
        lazy_repo,
        lazy_path,
    })

    if vim.v.shell_error ~= 0 then
        vim.cmd("echo 'Failed to install lazy.nvim! Press any key to exit...' | redraw")
        vim.fn.getchar()

        os.exit(1)
    end
end

-- Add lazy.nvim to the runtime path
vim.opt.rtp:prepend(lazy_path)

-- Install and configure plugins
require("lazy").setup("plugins")
