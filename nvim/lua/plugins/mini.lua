return {
    'echasnovski/mini.nvim',
    dependencies = {
        'nvim-tree/nvim-web-devicons',
    },
    version = '*',
    config = function()
        require('mini.hues').setup({
            background = '#1a1a19',
            foreground = '#d1d1d1',
        })

        require('mini.completion').setup({
            delay = {
                completion = 250,
            },
        })

        require('mini.comment').setup()
        require('mini.indentscope').setup()
        require('mini.pairs').setup()
        require('mini.surround').setup()

        require('mini.cursorword').setup()
        require('mini.notify').setup()
        require('mini.statusline').setup()
        require('mini.tabline').setup()

        require('mini.starter').setup()
        require('mini.sessions').setup()
    end,
}
