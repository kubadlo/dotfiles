return {
    'nvim-telescope/telescope.nvim',
    dependencies = {
        'nvim-telescope/telescope-file-browser.nvim',
        'nvim-telescope/telescope-frecency.nvim',
        'nvim-telescope/telescope-ui-select.nvim',
        'nvim-lua/plenary.nvim',
        'nvim-tree/nvim-web-devicons',
    },
    cmd = 'Telescope',
    keys = {
        { '<leader>ff', '<cmd>Telescope find_files<CR>',                                 desc = 'Find files' },
        { '<leader>fg', '<cmd>Telescope live_grep<CR>',                                  desc = 'Find in files' },
        { '<leader>fe', '<cmd>Telescope file_browser path=%:p:h select_buffer=true<CR>', desc = 'List files' },
        { '<leader>fr', '<cmd>Telescope frecency workspace=CWD<CR>',                     desc = 'List recently used files' },
        { '<leader>fb', '<cmd>Telescope buffers<CR>',                                    desc = 'List open buffers' },
    },
    config = function()
        local telescope = require('telescope')
        telescope.setup()

        telescope.load_extension('file_browser')
        telescope.load_extension('ui-select')
    end,
}
