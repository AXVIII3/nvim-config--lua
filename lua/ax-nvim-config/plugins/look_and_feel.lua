-- These enhance the look and feel of the vim editor (I can live without these but I'd rather not)

return {
    -- Colorscheme
    { 
        "navarasu/onedark.nvim",
        priority = 1000, -- Highest Priority
        config = require("ax-nvim-config.plugins_configs.onedark")
    },

    -- Status Line
    {
        "tamton-aquib/staline.nvim",
        event = "VeryLazy",
        config = require("ax-nvim-config.plugins_configs.staline")
    },

    -- Context Viewer
    {
        "wellle/context.vim",
        event = { "BufReadPost", "BufWritePost", "BufNewFile" },
        config = function() vim.cmd "ContextActivate" end
    }
}
