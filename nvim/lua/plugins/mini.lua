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

        require('mini.comment').setup()
        require('mini.indentscope').setup()
        require('mini.pairs').setup()
        require('mini.surround').setup()

        require('mini.completion').setup()
        require('mini.cursorword').setup()
        require('mini.notify').setup()
        require('mini.starter').setup()
        require('mini.statusline').setup()
        require('mini.tabline').setup()
    end,
}
