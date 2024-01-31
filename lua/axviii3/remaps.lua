-- Leader set to space
vim.g.mapleader = " "

-- Plugin Remaps which cant be set in config (e.g. the plugin is lazy loaded)
vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle)
vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
