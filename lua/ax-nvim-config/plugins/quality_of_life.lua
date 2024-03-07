-- Can live without these but, God! don't they make life easier

return {
    -- Move lines up or down
    {
        "echasnovski/mini.move",
        version = '*',
        event = { "BufReadPost", "BufWritePost", "BufNewFile" },
        config = function() require("mini.move").setup() end
    },

    -- Commenting shortcut
    {
        "numToStr/Comment.nvim",
        config = function() require("Comment").setup({ mappings = { basic = false, extra = false } }) end
    },

    -- Multiple cursors
    {
        "brenton-leighton/multiple-cursors.nvim",
        version = "*",
        event = { "BufReadPost", "BufWritePost", "BufNewFile" },
        config = function() require("multiple-cursors").setup() end
    },

    -- Color picker (Life saver in CSS and stuff)
    {
        "ziontee113/color-picker.nvim",
        config = function() require("color-picker").setup({ ["background_highlight_group"] = "PMenu" }) end
    }
}
