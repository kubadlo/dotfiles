vim.pack.add({
    "https://github.com/mason-org/mason.nvim",
    "https://github.com/mason-org/mason-lspconfig.nvim",
    "https://github.com/neovim/nvim-lspconfig",
})

vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(event)
        local client = vim.lsp.get_client_by_id(event.data.client_id)
        if (client == nil) then
            return
        end

        if client:supports_method("inlayHint/resolve") then
            vim.lsp.inlay_hint.enable(true, { bufnr = event.buf })
        end
    end
})

require("mason").setup({
    install_root_dir = vim.fn.stdpath("data") .. "/site/mason",
})

require("mason-lspconfig").setup({
    ensure_installed = {
        "astro",
        "cssls",
        "dockerls",
        "eslint",
        "graphql",
        "harper_ls",
        "html",
        "jsonls",
        "lua_ls",
        "rust_analyzer",
        "tailwindcss",
        "vtsls",
        "yamlls",
    },
})
