return {
    "folke/trouble.nvim",
    keys = { "<leader>tt", "<leader>tn", "<leader>tp" },
    config = function()
        local trouble = require("trouble")
        trouble.setup()

        vim.keymap.set("n", "<leader>tt", function() trouble.toggle() end)
        vim.keymap.set("n", "<leader>tn", function() trouble.next({ skip_groups = true, jump = true }) end)
        vim.keymap.set("n", "<leader>tp", function() trouble.previous({ skip_groups = true, jump = true }) end)
    end
}
