return {
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
        'nvim-treesitter/nvim-treesitter-context',
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
        require('treesitter-context').setup()
    end,
}
