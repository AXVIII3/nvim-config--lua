return {
    "navarasu/onedark.nvim",
    lazy = false,
    config = function()
        require("onedark").setup {
            ending_tildes = true,
            style = 'cool',
            transparent = true
        }
        require('onedark').load()
    end
}
