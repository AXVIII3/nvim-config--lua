return function()
    require("nvim-treesitter.install").prefer_git = true;
    require("nvim-treesitter.configs").setup({
        ensure_installed = require("settings").ensure_installed_parsers,
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

        textobjects = {
            select = {
                enable = true,
                lookahead = true,
                include_surrounding_whitespace = true,
                keymaps = {
                    ["af"] = "@function.outer",
                    ["if"] = "@function.inner",
                    ["ac"] = "@class.outer",
                    ["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
                    ["as"] = { query = "@scope", query_group = "locals", desc = "Select language scope" }
                }
            },
            swap = {
                enable = true,
                swap_next = { ["<M-J>"] = "@parameter.inner", },
                swap_previous = { ["<M-K>"] = "@parameter.inner", }
            },
        }
    });
end
