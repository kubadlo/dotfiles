return {
    'neovim/nvim-lspconfig',
    dependencies = {
        'williamboman/mason.nvim',
        'williamboman/mason-lspconfig.nvim',
    },
    event = {
        "BufReadPre",
        "BufNewFile",
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
        local cmp = require('cmp_nvim_lsp')

        lsp.cssls.setup({
            capabilities = cmp.default_capabilities(),
        })
        lsp.html.setup({
            capabilities = cmp.default_capabilities(),
        })
        lsp.jsonls.setup({
            capabilities = cmp.default_capabilities(),
        })
        lsp.tailwindcss.setup({
            capabilities = cmp.default_capabilities(),
        })
        lsp.tsserver.setup({
            capabilities = cmp.default_capabilities(),
        })

        lsp.eslint.setup({
            capabilities = cmp.default_capabilities(),
            on_attach = function(_, bufnr)
                vim.api.nvim_create_autocmd("BufWritePre", {
                    buffer = bufnr,
                    command = "EslintFixAll",
                })
            end,
        })

        lsp.lua_ls.setup({
            capabilities = cmp.default_capabilities(),
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
