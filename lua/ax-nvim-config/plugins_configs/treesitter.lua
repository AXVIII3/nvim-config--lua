return function()
    require"nvim-treesitter.configs".setup({
        ensure_installed = require("settings").ensure_installed_parsers,
        sync_install = false,
        auto_install = true,
        highlight = {
            enable = true,
            additional_vim_regex_highlighting = false,
        },
    });
    require("nvim-treesitter.install").prefer_git = true;
end
