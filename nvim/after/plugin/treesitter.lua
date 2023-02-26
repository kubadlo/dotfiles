require("nvim-treesitter.configs").setup({
    ensure_installed = {
        "astro",
        "css",
        "html",
        "javascript",
        "lua",
        "prisma",
        "rust",
        "typescript",
    },
    highlight = {
        enable = true,
    },
})
