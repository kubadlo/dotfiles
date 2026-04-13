vim.api.nvim_create_autocmd("FileType", {
    desc = "Enable treesitter",
    callback = function()
        if pcall(vim.treesitter.start) then
            -- Tree-sitter-based folding
            vim.wo.foldexpr   = "v:lua.vim.treesitter.foldexpr()"
            vim.wo.foldmethod = "expr"

            -- Start with all folds open
            vim.wo.foldlevel  = 99
        end
    end
})

vim.api.nvim_create_autocmd("PackChanged", {
    desc     = "Update tree-sitter parsers",
    callback = function(event)
        local name = event.data.spec.name
        local kind = event.data.kind

        if name == "nvim-treesitter" and kind == "update" then
            if not event.data.active then
                vim.cmd.packadd("nvim-treesitter")
            end

            vim.cmd("TSUpdate")
        end
    end
})

vim.pack.add({
    "https://github.com/nvim-treesitter/nvim-treesitter",
})

require("nvim-treesitter").setup({
    install_dir = vim.fn.stdpath("data") .. "/site/treesitter",
})

require("nvim-treesitter").install({
    "astro",
    "bash",
    "css",
    "diff",
    "dockerfile",
    "editorconfig",
    "gitattributes",
    "gitcommit",
    "gitignore",
    "graphql",
    "html",
    "javascript",
    "jsdoc",
    "json",
    "lua",
    "luadoc",
    "markdown",
    "markdown_inline",
    "rust",
    "sql",
    "toml",
    "tsx",
    "typescript",
    "yaml",
    "zsh",
})
