return {
    'mhartington/formatter.nvim',
    cmd = {
        'Format',
        'FormatWrite',
    },
    keys = {
        { '<leader>pf', '<cmd>Format prettier<cr>',      desc = 'Format buffer with Prettier' },
        { '<leader>pw', '<cmd>FormatWrite prettier<cr>', desc = 'Format and save buffer with Prettier' },
    },
    config = function()
        local defaults = require('formatter.defaults')
        local util = require('formatter.util')

        require('formatter').setup({
            filetype = {
                css = util.withl(defaults.prettier),
                html = util.withl(defaults.prettier),
                javascript = util.withl(defaults.prettier),
                json = util.withl(defaults.prettier),
                typescrip = util.withl(defaults.prettier),
                typescriptreact = util.withl(defaults.prettier),
            },
        })
    end,
}
