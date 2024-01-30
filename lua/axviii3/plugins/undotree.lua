-- Undotree for persistent and visual undoing
return {
    "mbbill/undotree",
    config = function()
	vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle)
    end
}
