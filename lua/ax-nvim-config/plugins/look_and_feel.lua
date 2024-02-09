-- These enhance the look and feel of the vim editor (I can live without these but I'd rather not)

return {
    -- Colorscheme
    { 
        "navarasu/onedark.nvim",
        priority = 1000, -- Highest Priority
        config = require("ax-nvim-config.plugins_configs.onedark")
    },

    -- Better commandline and notifications
    {
        "folke/noice.nvim",
        dependencies = { "nui", "notify" },
        config = require("ax-nvim-config.plugins_configs.noice")
    },

    -- Breadcumbds
    {
        "LunarVim/breadcrumbs.nvim",
        dependencies = { "nvim-navic", "devicons" },
        config = require("ax-nvim-config.plugins_configs.breadcrumbs")
    },

    -- Icons for Netrw
    {
        "prichrd/netrw.nvim",
        dependencies = "devicons",
        config = require("ax-nvim-config.plugins_configs.netrwextras")
    },

    -- Show indentation-levels as lines
    {
        "lukas-reineke/indent-blankline.nvim",
        config = function() require("ibl").setup() end
    },

    -- Status Line
    {
        'nvim-lualine/lualine.nvim',
        config = function() require('lualine').setup({ options = { theme = "onedark" } }) end
    }
}
