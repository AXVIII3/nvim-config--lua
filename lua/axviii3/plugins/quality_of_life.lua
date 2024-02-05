-- I can survive without these plugins but they are great nonetheless
return {
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        config = function()
            require("noice").setup()
            vim.keymap.set("n", "<leader>nd", "<cmd> NoiceDismiss<CR>")
        end,
        dependencies = {
            -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
            "MunifTanjim/nui.nvim",
            -- OPTIONAL:
            --   `nvim-notify` is only needed, if you want to use the notification view.
            --   If not available, we use `mini` as the fallback
            {
                "rcarriga/nvim-notify",
                config = function()
                    require("notify").setup({
                        background_colour = "#11f2229"
                    })
                end
            }
        }
    },

    {
        -- A better and more pleasing status line
        'nvim-lualine/lualine.nvim',
        event = "VeryLazy",
        config = function()
            require('lualine').setup()
        end
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

    -- Hides stuff as set up
    {
        "laytan/cloak.nvim",
        event = "VeryLazy",
        config = function()
            require('cloak').setup({
                enabled = true,
                cloak_character = '*',
                highlight_group = 'Comment',
                cloak_length = nil, -- Provide a number if you want to hide the true length of the value.
                try_all_patterns = true,
                patterns = {
                    {
                        file_pattern = { '.env*' },
                        cloak_pattern = { '=.+' },
                        replace = nil,
                    },
                },
            })
        end
    },

    {
        "brenton-leighton/multiple-cursors.nvim",
        version = "*",
        event = "VeryLazy",
        config = function()
            require("multiple-cursors").setup()
        end,
        keys = {
            {"<leader><C-j>", "<Cmd>MultipleCursorsAddDown<CR>", mode = {"n"}},
            {"<leader><C-k>", "<Cmd>MultipleCursorsAddUp<CR>", mode = {"n"}},
            {"<leader><C-s>", "<Cmd>MultipleCursorsAddBySearch<CR>", mode = {"n", "x"}},
            {"<leader><C-v>", "<Cmd>MultipleCursorsAddBySearchV<CR>", mode = {"n", "x"}},
        },
    },
}
