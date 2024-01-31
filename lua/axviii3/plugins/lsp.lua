return {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
        { 
            "neovim/nvim-lspconfig",
            dependencies = { "williamboman/mason.nvim" }
        }
    },
    config = function()
        require("mason").setup()
        require("mason-lspconfig").setup()
    end
}
