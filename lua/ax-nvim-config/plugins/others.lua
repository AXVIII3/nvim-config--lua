-- These are other plugins which can't be classified

return {
    -- Globally accessible wiki with nice features
    {
        "vimwiki/vimwiki",
        keys = { "<leader>ww" },
        init = require("ax-nvim-config.plugins_configs.vimwiki")
    },

    -- Hides values in editor as defined
    {
        "laytan/cloak.nvim",
        event = { "BufReadPost", "BufWritePost", "BufNewFile" },
        config = require("ax-nvim-config.plugins_configs.cloak")
    }
}
