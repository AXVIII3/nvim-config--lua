return {
    "navarasu/onedark.nvim",
    lazy = false,
    config = function()
        require("onedark").setup {
            style = 'cool',
            transparent = true
        }
        require('onedark').load()
    end
}
