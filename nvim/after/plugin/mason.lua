require("mason").setup()

require("mason-lspconfig").setup({
    ensure_installed = {
        "astro",
        "cssls",
        "eslint",
        "html",
        "lua_ls",
        "prismals",
        "rust_analyzer",
        "tailwindcss",
        "tsserver",
    },
})

local lsp = require("lspconfig")

local on_attach = function(_, bufnr)
    local bufopts = {
        noremap = true,
        silent = true,
        buffer = bufnr
    }

    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
    vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
    vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)
end


lsp.astro.setup({
    on_attach = on_attach
})
lsp.cssls.setup({
    on_attach = on_attach
})
lsp.eslint.setup({
    on_attach = on_attach
})
lsp.html.setup({
    on_attach = on_attach
})
lsp.lua_ls.setup({
    on_attach = on_attach,
    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim" },
            },
        },
    },
})
lsp.prismals.setup({
    on_attach = on_attach
})
lsp.rust_analyzer.setup({
    on_attach = on_attach
})
lsp.tailwindcss.setup({
    on_attach = on_attach
})
lsp.tsserver.setup({
    on_attach = on_attach,
})
