return {
    "navarasu/onedark.nvim",
    lazy = false,
    config = function()
        require("onedark").setup {
            ending_tildes = true,
            style = 'cool',
            transparent = true,
            colors = {
                bg0 = "#1f2229",
            }
        }
        require('onedark').load()
    end
}
