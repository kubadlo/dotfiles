require("packer").startup(function(use)
    use "wbthomason/packer.nvim"

    use {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.1",
        requires = "nvim-lua/plenary.nvim",
    }

    use {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
    }

    use {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig",
    }

    use {
        "jose-elias-alvarez/null-ls.nvim",
        require = "nvim-lua/plenary.nvim",
    }

    use {
        "hrsh7th/nvim-cmp",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
    }

    use {
        "hrsh7th/vim-vsnip",
        "hrsh7th/cmp-vsnip",
        "rafamadriz/friendly-snippets",
    }

    use {
        "nvim-tree/nvim-tree.lua",
        require = "nvim-tree/nvim-web-devicons",
    }

    use {
        "folke/trouble.nvim",
        require = "nvim-tree/nvim-web-devicons",
    }

    use {
        "rose-pine/neovim",
        as = "rose-pine",
    }

    use "github/copilot.vim"
end)
