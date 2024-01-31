-- Plugins which do not need their own file or aren't very important
return {
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 500
        end,
    },
    {
        "numToStr/Comment.nvim",
        config = function()
            require('Comment').setup()
        end
    }
}
