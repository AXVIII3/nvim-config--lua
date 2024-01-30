return {
    -- One Dark Colorscheme
    {
        "navarasu/onedark.nvim",
        priority = 1000, -- make sure this plugin is loaded first
        config = function()
            require("onedark").setup {
                style = 'cool',
                transparent = true
            }
            require('onedark').load()
        end
    }
}
