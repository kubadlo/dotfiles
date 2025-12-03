local add, now, later = MiniDeps.add, MiniDeps.now, MiniDeps.later

now(function()
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
end)

later(function()
    add({ source = "neovim/nvim-lspconfig" })
end)

later(function()
    add({ source = "mason-org/mason.nvim" })

    require("mason").setup({
        install_root_dir = vim.fn.stdpath("data") .. "/site/mason",
    })
end)

later(function()
    add({ source = "mason-org/mason-lspconfig.nvim" })

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
    add({ source = "stevearc/conform.nvim" })

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
