return {
    'neovim/nvim-lspconfig',
    dependencies = {
        'williamboman/mason.nvim',
        'williamboman/mason-lspconfig.nvim',
    },
    opts = {
        ensure_installed = {
            'cssls',
            'eslint',
            'html',
            'jsonls',
            'lua_ls',
            'tailwindcss',
            'tsserver',
        },
    },
    config = function(_, opts)
        require('mason').setup()
        require('mason-lspconfig').setup(opts)

        local lsp = require('lspconfig')

        lsp.cssls.setup({})
        lsp.html.setup({})
        lsp.jsonls.setup({})
        lsp.tailwindcss.setup({})
        lsp.tsserver.setup({})

        lsp.eslint.setup({
            on_attach = function(_, bufnr)
                vim.api.nvim_create_autocmd("BufWritePre", {
                    buffer = bufnr,
                    command = "EslintFixAll",
                })
            end,
        })

        lsp.lua_ls.setup({
            settings = {
                Lua = {
                    diagnostics = {
                        globals = { 'vim', 'require' },
                    },
                },
            },
        })
    end,
}
