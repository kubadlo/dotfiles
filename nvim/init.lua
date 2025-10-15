local data_path = vim.fn.stdpath("data")

local mini_path = data_path .. "/site/pack/deps/start/mini.nvim"
local mini_repo = "https://github.com/nvim-mini/mini.nvim"

if not vim.loop.fs_stat(mini_path) then
    vim.cmd("echo 'Installing `mini.nvim`' | redraw")
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        mini_repo,
        mini_path,
    })

    vim.cmd("packadd mini.nvim | helptags ALL")
    vim.cmd("echo 'Installed `mini.nvim`' | redraw")
end

require("mini.deps").setup()
