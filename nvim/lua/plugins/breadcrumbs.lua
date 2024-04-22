return {
    'LunarVim/breadcrumbs.nvim',
    dependencies = {
        'SmiteshP/nvim-navic'
    },
    event = {
        "BufReadPre",
        "BufNewFile",
    },
    opts = {
        click = true,
        lsp = {
            auto_attach = true,
        },
    },
    config = function(_, opts)
        require('nvim-navic').setup(opts)
        require('breadcrumbs').setup()
    end,
}
