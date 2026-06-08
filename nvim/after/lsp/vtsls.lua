local MAX_MEMORY = 8192

---@type vim.lsp.Config
return {
    settings = {
        typescript = {
            tsserver = {
                maxTsServerMemory = MAX_MEMORY,
            },
        },
        javascript = {
            tsserver = {
                maxTsServerMemory = MAX_MEMORY,
            },
        },
    },
}
