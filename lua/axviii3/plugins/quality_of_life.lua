-- I can survive without these plugins but they are great nonetheless
return {
    {
        "eckon/treesitter-current-functions",
        dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-telescope/telescope.nvim" },
        config = function()
            vim.keymap.set("n", "<leader>fn", "<cmd>:GetCurrentFunctions<CR>")
        end,
        opts = {}
    },

    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        opts = {}
    },

    {
        "folke/noice.nvim",
        lazy = false,
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
        lazy = false,
        config = function()
            require('lualine').setup()
        end
    },

    -- Highlights yanked text for a bit
    {
        "machakann/vim-highlightedyank",
        lazy = false,
        config = function()
            vim.g.highlightedyank_highlight_duration = 500
        end
    },

    -- Adds comment shortcuts
    {
        "numToStr/Comment.nvim",
        lazy = false,
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
        lazy = false,
        config = function()
            require("netrw").setup {
                use_devicons = true
            }
        end
    },

    -- Hides stuff as set up
    {
        "laytan/cloak.nvim",
        lazy = false,
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
        lazy = false,
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
