return {
    "nvim-telescope/telescope-ui-select.nvim",
    lazy = false,
    dependencies = {
        'nvim-telescope/telescope.nvim', tag = '0.1.5', -- latest as of 30.01.24
        lazy = false,
        config = function()
            local builtin = require('telescope.builtin')
            vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
            vim.keymap.set('n', '<leader>fg', builtin.git_files, {})
            vim.keymap.set('n', '<leader>fw', function()
                builtin.grep_string({ search = vim.fn.expand("<cword>") })
            end)
            vim.keymap.set('n', '<leader>fW', function()
                builtin.grep_string({ search = vim.fn.expand("<cWORD>") })
            end)
            vim.keymap.set('n', '<leader>fs', function()
                builtin.grep_string({ search = vim.fn.input("Grep > ") })
            end)

            require("telescope").load_extension("noice")
            vim.keymap.set("n", "<leader>tn", "<cmd> Telescope noice<CR>")
        end
    },
    config = function()
        -- This is your opts table
        require("telescope").setup {
            extensions = {
                ["ui-select"] = {
                    require("telescope.themes").get_dropdown {
                    }
                }
            }
        }
        -- To get ui-select loaded and working with telescope, you need to call
        -- load_extension, somewhere after setup function:
        require("telescope").load_extension("ui-select")
    end
}
