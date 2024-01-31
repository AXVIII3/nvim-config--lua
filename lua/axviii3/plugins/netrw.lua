return {
    "prichrd/netrw.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        require("netrw").setup {
            use_devicons = true
        }
        local isLexOpen = false -- Store if the netrw drawer window is open
        vim.keymap.set("n", "<leader>q", function()
            vim.g.netrw_banner = 0
            if not isLexOpen then 
                vim.cmd "Lex %:p:h"
                isLexOpen = true
            else
                vim.cmd "Lex"
                isLexOpen = false
            end
        end) -- Open Netrw as File Drawer
        vim.keymap.set("n", "<leader>Q", function()
            vim.g.netrw_banner = 1
            vim.g.netrw_chgwin = -1
            vim.cmd "Ex"
        end) -- Open Netrw as File Explorer
    end
}
