-- Absolutely non-negotiable must have plugins

return {
    -- Undotree for visual undoing with trees
    {
        "mbbill/undotree",
        event = { "BufReadPost", "BufWritePost", "BufNewFile" },
    },

    -- Harpoon for quick switching
    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        dependencies = "plenary",
        config = function() require("harpoon").setup() end
    },

    -- Fuzzy finder for multiple kinds of searching
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.5', -- latest as of 10th Feb '24
        name = "telescope",
        dependencies = "plenary",
        config = require("ax-nvim-config.plugins_configs.telescope")
    },
    {
        "nvim-telescope/telescope-ui-select.nvim",
        dependencies = "telescope"
    },

    -- Better parsing and highlighting
    {
        "nvim-treesitter/nvim-treesitter",
        name = "treesitter",
        build = ":TSUpdate",
        event = { "BufReadPost", "BufWritePost", "BufNewFile" },
        cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
        init = function(plugin)
            require("lazy.core.loader").add_to_rtp(plugin)
            require("nvim-treesitter.query_predicates")
        end,
        config = require("ax-nvim-config.plugins_configs.treesitter")
    },
    {
        "eckon/treesitter-current-functions",
        dependencies = { "treesitter", "telescope" },
        event = { "BufReadPost", "BufWritePost", "BufNewFile" },
        config = function() require("tscf") end
    },
    {
        "nvim-treesitter/nvim-treesitter-textobjects",
        dependencies = "treesitter",
        event = { "BufReadPost", "BufWritePost", "BufNewFile" }
    }
}
