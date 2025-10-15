local add = MiniDeps.add

add({
    source = "nvim-treesitter/nvim-treesitter",
    checkout = "main",
    hooks = {
        post_checkout = function() vim.cmd("TSUpdate") end,
    },
})

require("nvim-treesitter").setup({
    install_dir = vim.fn.stdpath("data") .. "/site/treesitter",
})

require("nvim-treesitter").install({
    "astro",
    "css",
    "html",
    "javascript",
    "json",
    "lua",
    "typescript",
    "yaml",
})
