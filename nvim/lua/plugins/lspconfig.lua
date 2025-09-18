return {
    "neovim/nvim-lspconfig",
    event = "BufEnter",
    dependencies = {
        "mason-org/mason.nvim",
        "mason-org/mason-lspconfig.nvim",
    },
    config = function()
        require("mason").setup()
        require("mason-lspconfig").setup({
            ensure_installed = {
                "harper_ls",
                "lua_ls",
            },
        })
    end,
}
