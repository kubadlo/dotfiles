require("settings")
require("mappings")

local data_path = vim.fn.stdpath("data")
local lazy_path = data_path .. "/lazy/lazy.nvim"

-- Install lazy.nvim if not already installed
if not (vim.uv or vim.loop).fs_stat(lazy_path) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "--branch=stable",
        "https://github.com/folke/lazy.nvim.git",
        lazy_path,
    })
end

-- Add lazy to the runtime path
vim.opt.rtp:prepend(lazy_path)

-- Install and configure plugins
require("lazy").setup("plugins")
