vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    callback = function(event)
        local opts = { buffer = event.buf }

        vim.keymap.set('n', 'K', vim.lsp.buf.hover({ hover = 'single' }), opts)

        vim.keymap.set('n', 'gd', '<cmd>Telescope lsp_definitions<CR>', opts)
        vim.keymap.set('n', 'gt', '<cmd>Telescope lsp_type_definitions<CR>', opts)
        vim.keymap.set('n', 'gi', '<cmd>Telescope lsp_implementations<CR>', opts)
        vim.keymap.set('n', 'gr', '<cmd>Telescope lsp_references<CR>', opts)

        vim.keymap.set('n', '<leader>cd', '<cmd>Telescope diagnostics<CR>', opts)
        vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
        vim.keymap.set('n', '<leader>cr', vim.lsp.buf.rename, opts)
        vim.keymap.set('n', '<leader>cf', function()
            vim.lsp.buf.format { async = true }
        end, opts)
    end,
})
