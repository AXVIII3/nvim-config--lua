-- I can survive without these plugins but they are great nonetheless
return {
    {
        -- Some netrw quality of life stuff (including icons!)
        "prichrd/netrw.nvim",
        event = "VeryLazy",
        config = function()
            require("netrw").setup {
                use_devicons = true
            }
        end
    },

    {
        -- A better and more pleasing status line
        'nvim-lualine/lualine.nvim',
        event = "VeryLazy",
        config = function()
            require('lualine').setup()
        end
    },

    {
        "brenton-leighton/multiple-cursors.nvim",
        version = "*",
        config = function()
            require("multiple-cursors").setup()
        end,
        keys = {
            {"<C-c><C-j>", "<Cmd>MultipleCursorsAddDown<CR>", mode = {"n"}},
            {"<C-c><C-k>", "<Cmd>MultipleCursorsAddUp<CR>", mode = {"n"}},
            {"<C-c><C-s>", "<Cmd>MultipleCursorsAddBySearch<CR>", mode = {"n", "x"}},
            {"<C-c><C-v>", "<Cmd>MultipleCursorsAddBySearchV<CR>", mode = {"n", "x"}},
        },
    },

    -- Highlights yanked text for a bit
    {
        "machakann/vim-highlightedyank",
        event = "VeryLazy",
        config = function()
            vim.g.highlightedyank_highlight_duration = 500
        end
    },

    -- Adds comment shortcuts
    {
        "numToStr/Comment.nvim",
        event = "VeryLazy",
        config = function()
            require('Comment').setup({
                mappings = {
                    basic = true,
                    extra = false
                },
                toggler = {
                    line = "<C-c><C-c>",
                    block = "<C-x><C-x>"
                },
                opleader = {
                    line = "<C-c>",
                    block = "<C-x>"
                }
            })
        end
    },

    -- Hides stuff as set up
    {
        "laytan/cloak.nvim",
        event = "VeryLazy",
        config = function()
            require('cloak').setup({
                enabled = true,
                cloak_character = '*',
                -- The applied highlight group (colors) on the cloaking, see `:h highlight`.
                highlight_group = 'Comment',
                cloak_length = nil, -- Provide a number if you want to hide the true length of the value.
                -- Wether it should try every pattern to find the best fit or stop after the first.
                try_all_patterns = true,
                patterns = {
                    {
                        -- Match any file starting with '.env'.
                        -- This is a table to match multiple file patterns.
                        file_pattern = { '.env*' },
                        -- Match an equals sign and any character after it.
                        -- This is a table of patterns to cloak,
                        -- example: cloak_pattern = { ':.+', '-.+' } for yaml files.
                        cloak_pattern = { '=.+' },
                        -- A function, table or string to generate the replacement.
                        -- The actual replacement will contain the 'cloak_character'
                        -- where it doesn't cover the original text.
                        -- If left emtpy the legacy behavior of keeping the first character is retained.
                        replace = nil,
                    },
                },
            })
        end
    }
}
