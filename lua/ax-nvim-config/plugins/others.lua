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
    },

    -- To live preview markdown with synced scrolling (useful during notes taking)
    {
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        build = "cd app && yarn install",
        init = function()
            vim.g.mkdp_filetypes = { "markdown" }
        end,
        ft = { "markdown" },
    }
}
