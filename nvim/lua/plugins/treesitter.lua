return {
    'nvim-treesitter/nvim-treesitter',
    event = {
        "BufReadPost",
        "BufNewFile",
    },
    build = ':TSUpdate',
    opts = {
        auto_install = true,
        highlight = {
            enable = true,
        },
    },
    config = function(_, opts)
        require('nvim-treesitter.configs').setup(opts)
    end,
}
