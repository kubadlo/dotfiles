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

require("conform").setup({
    formatters = {
        biome = {
            require_cwd = true,
        },
        prettier = {
            condition = (function()
                local cache = {}

                ---@param _   conform.JobFormatterConfig
                ---@param ctx conform.Context
                return function(_, ctx)
                    local root = vim.fs.root(ctx.filename, { "package.json", ".git" })
                    local path = root or ctx.filename

                    if cache[path] == nil then
                        vim.fn.system({
                            "prettier",
                            "--find-config-path",
                            ctx.filename,
                        })

                        cache[path] = vim.v.shell_error == 0
                    end

                    return cache[path]
                end
            end)(),
        },
    },
    formatters_by_ft = {
        astro           = { "prettier" },
        css             = { "biome", "prettier" },
        graphql         = { "biome", "prettier" },
        html            = { "biome", "prettier" },
        javascript      = { "biome", "prettier" },
        javascriptreact = { "biome", "prettier" },
        json            = { "biome", "prettier" },
        jsonc           = { "biome", "prettier" },
        markdown        = { "prettier" },
        typescript      = { "biome", "prettier" },
        typescriptreact = { "biome", "prettier" },
        yaml            = { "prettier" },
    },
    format_on_save = {
        timeout_ms = 500,
        lsp_format = "fallback",
    },
})

require("codediff").setup({
    explorer = {
        view_mode = "tree",
    },
})
