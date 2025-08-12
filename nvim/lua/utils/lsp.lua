return {
    code_action = function()
        vim.lsp.buf.code_action({
            context = {
                diagnostics = {},
                only = { "source", "refactor", "quickfix" },
            },
        })
    end,
    code_format = function()
        vim.lsp.buf.format({
            async = true,
        })
    end,
}
