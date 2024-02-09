-- Can live without these but, God! don't they make life easier

return {
    -- Move lines up or down
    {
        "echasnovski/mini.nvim",
        version = '*',
        config = require("ax-nvim-config.plugins_configs.minimove")
    },

    -- Commenting shortcut
    {
        "numToStr/Comment.nvim",
        config = require("ax-nvim-config.plugins_configs.comment")
    },

    -- Multiple cursors
    {
        "brenton-leighton/multiple-cursors.nvim",
        version = "*",
        config = function() require("multiple-cursors").setup() end
    },

    -- Hides values in editor as defined
    {
        "laytan/cloak.nvim",
        config = require("ax-nvim-config.plugins_configs.cloak")
    }
}
