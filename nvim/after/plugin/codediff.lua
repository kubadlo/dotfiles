vim.pack.add({
    "https://github.com/esmuellert/codediff.nvim",
})

require("codediff").setup({
    explorer = {
        view_mode = "tree",
    }
})
