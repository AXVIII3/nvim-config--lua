-- Git wrapper
return {
    "tpope/vim-fugitive",
    cmd = "Git",
    config = function()
        vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
    end
}
