return {
    'nvim-telescope/telescope.nvim', tag = '0.1.5', -- latest as of 30.01.24
    dependencies = { 'nvim-lua/plenary.nvim' },
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
    end
}
