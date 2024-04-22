local data_path = vim.fn.stdpath('data')
local lazy_path = data_path .. '/lazy/lazy.nvim'

if not vim.loop.fs_stat(lazy_path) then
    vim.fn.system({
        'git',
        'clone',
        'https://github.com/folke/lazy.nvim.git',
        '--filter=blob:none',
        '--branch=stable',
        lazy_path,
    })
end

vim.opt.rtp:prepend(lazy_path)

require('lazy').setup('plugins')
