vim.pack.add({
    "https://github.com/mason-org/mason.nvim",
    "https://github.com/mason-org/mason-lspconfig.nvim",
    "https://github.com/neovim/nvim-lspconfig",
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
