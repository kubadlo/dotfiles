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
    "tsx",
    "yaml",
})

vim.api.nvim_create_autocmd("FileType", {
    desc = "Enable treesitter",
    callback = function()
        if pcall(vim.treesitter.start) then
            vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
            vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end
    end
})
