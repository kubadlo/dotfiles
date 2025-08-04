return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    ---@type TSConfig
    opts = {
        auto_install = true,
        sync_install = false,
        ignore_install = {},
        ensure_installed = {},
        modules = {},
        highlight = {
            enable = true,
        },
        indent = {
            enable = true,
        },
    },
    ---@param opts TSConfig
    config = function(_, opts)
        require("nvim-treesitter.configs").setup(opts)
    end,
}
