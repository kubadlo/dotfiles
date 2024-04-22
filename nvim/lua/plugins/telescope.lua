return {
    'nvim-telescope/telescope.nvim',
    dependencies = {
        'nvim-lua/plenary.nvim',
        'nvim-tree/nvim-web-devicons',
    },
    cmd = 'Telescope',
    keys = {
        { '<leader>ff', '<cmd>Telescope find_files<CR>', desc = 'Find files' },
        { '<leader>fg', '<cmd>Telescope live_grep<CR>',  desc = 'Find in files' },
        { '<leader>fb', '<cmd>Telescope buffers<CR>',    desc = 'List open buffers' },
        { '<leader>v',  '<cmd>Telescope registers<CR>',  desc = 'Lists vim registers' },
    },
    opts = {},
}
