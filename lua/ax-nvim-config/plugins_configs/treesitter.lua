return function()
    require("nvim-treesitter.install").prefer_git = true;
    require("nvim-treesitter.configs").setup({
        sync_install = false,
        auto_install = true,

        highlight = {
            enable = true,
            additional_vim_regex_highlighting = false,
        },

        incremental_selection = {
            enable = true,
            keymaps = {
                init_selection = "<leader>ss",
                node_incremental = "<leader>si",
                node_decremental = "<leader>sd",
                scope_incremental = "<leader>SS",
            }
        },

        indent = { enable = true },
    });
end
