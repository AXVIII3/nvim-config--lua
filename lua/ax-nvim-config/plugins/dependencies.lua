-- These plugins serve no purpose except being dependencies of other olugins

return {
    -- Used by "theprimeagen/harpoon" and "nvim-telescope/telescope"
    {
        "nvim-lua/plenary.nvim",
        name = "plenary",
        priority = 900 -- 2nd Highest Priority
    },

    -- Dependency required by "LunarVim/breadcrumbs.nvim"
    {
        "SmiteshP/nvim-navic",
        name = "nvim-navic",
        priority = 800 -- 3rd Highest Priority
    },

    -- Used by "prichrd/netrw.nvim", "LunarVim/breadcrumbs.nvim
    {
        "nvim-tree/nvim-web-devicons",
        name = "devicons",
        priority = 800 -- 3rd Highest Priority
    },

    -- Used by "folke/noice
    {
        "MunifTanjim/nui.nvim",
        name = "nui",
        priority = 800 -- 3rd Highest Priority
    },

    -- Used by "folke/noice
    {
        "rcarriga/nvim-notify",
        name = "notify",
        priority = 800, -- 3rd Highest Priority
        config = function() require("notify").setup({ background_colour = "#1f2229" }) end
    }
}
