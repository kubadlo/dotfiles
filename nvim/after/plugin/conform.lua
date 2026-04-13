vim.pack.add({
    "https://github.com/stevearc/conform.nvim",
})

---@type conform.setupOpts
local config = {
    formatters = {
        biome = {
            require_cwd = true,
        },
        prettier = {
            condition = (function()
                local cache = {}

                return function(_, ctx)
                    local root = vim.fs.root(ctx.filename, { "package.json", ".git" }) or ctx.filename
                    if cache[root] == nil then
                        vim.fn.system({
                            "prettier",
                            "--find-config-path",
                            ctx.filename,
                        })

                        cache[root] = vim.v.shell_error == 0
                    end

                    return cache[root]
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

}

require("conform").setup(config)
