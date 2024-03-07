return {
    -- LSP ------------------------------------------------------------
    {
        "williamboman/mason-lspconfig.nvim", -- Bridge btw mason and lspconfig
        dependencies = {
            "neovim/nvim-lspconfig",         -- Quick and Easy Configs
            "williamboman/mason.nvim",       -- For installing LSPs
            "cmp",
            "dap"
        },
        config = require("ax-nvim-config.plugins_configs.ide_features")
    },
    -------------------------------------------------------------------


    -- COMPLETION -----------------------------------------------------
    {
        "hrsh7th/nvim-cmp",                  -- Completion Engine
        name = "cmp",
        dependencies = {
            -- Not really dependencies but should be installed before setting up
            "hrsh7th/cmp-nvim-lsp",          -- For LSP completions
            "hrsh7th/cmp-buffer",            -- For buffer specific completions
            "hrsh7th/cmp-path",              -- For path completions
            "L3MON4D3/LuaSnip",              -- Snippet Engine
            "saadparwaiz1/cmp_luasnip",      -- IDK
            "folke/neodev.nvim"              -- NVIM faloured kua completion
        }
    },
    -------------------------------------------------------------------


    -- DAP ------------------------------------------------------------
    {
        "mfussenegger/nvim-dap",            -- Debugging Adapter Protocol
        name = "dap",
        dependencies = {
            -- Not really dependencies but should be installed before setting up
            "rcarriga/nvim-dap-ui",
            "theHamsta/nvim-dap-virtual-text",
            "nvim-telescope/telescope-dap.nvim"
        }
    },
    -------------------------------------------------------------------
}
