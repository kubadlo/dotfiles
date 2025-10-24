local add, later = MiniDeps.add, MiniDeps.later

later(function()
    add({
        source = "neovim/nvim-lspconfig",
        depends = {
            "mason-org/mason.nvim",
            "mason-org/mason-lspconfig.nvim",
        },
    })

    require("mason").setup({
        install_root_dir = vim.fn.stdpath("data") .. "/site/mason",
    })

    require("mason-lspconfig").setup({
        ensure_installed = {
            "harper_ls",
            "lua_ls",
        },
    })
end)

later(function()
    add({
        source = "saghen/blink.cmp",
        checkout = "v1.7.0",
        monitor = "main",
        depends = {
            "neovim/nvim-lspconfig",
        },
    })

    require("blink.cmp").setup({
        completion = {
            ghost_text = {
                enabled = true,
            },
        },
        keymap = {
            preset = "enter",
        },
    })
end)

later(function()
    add({
        source = "stevearc/conform.nvim",
        depends = {
            "neovim/nvim-lspconfig",
        },
    })

    require("conform").setup({
        formatters = {
            biome = {
                require_cwd = true,
            },
            prettier = {
                condition = function(_, ctx)
                    vim.fn.system({
                        "prettier",
                        "--find-config-path",
                        ctx.filename,
                    })

                    return vim.v.shell_error == 0
                end,
            },
        },
        formatters_by_ft = {
            astro = { "prettier" },
            css = { "biome", "prettier" },
            html = { "biome", "prettier" },
            javascript = { "biome", "prettier" },
            javascriptreact = { "biome", "prettier" },
            json = { "biome", "prettier" },
            jsonc = { "biome", "prettier" },
            markdown = { "prettier" },
            typescript = { "biome", "prettier" },
            typescriptreact = { "biome", "prettier" },
        },
        format_on_save = {
            timeout_ms = 500,
            lsp_format = "fallback",
        },
    })
end)
