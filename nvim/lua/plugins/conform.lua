return {
    "stevearc/conform.nvim",
    event = "BufEnter",
    ---@type conform.setupOpts
    opts = {
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
    },
}
