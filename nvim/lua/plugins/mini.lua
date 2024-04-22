return {
    'echasnovski/mini.nvim',
    dependencies = {
        'nvim-tree/nvim-web-devicons',
    },
    event = {
        "BufReadPost",
        "BufNewFile",
    },
    version = '*',
    config = function()
        require('mini.comment').setup()
        require('mini.indentscope').setup()
        require('mini.pairs').setup()
        require('mini.surround').setup()
    end,
}
