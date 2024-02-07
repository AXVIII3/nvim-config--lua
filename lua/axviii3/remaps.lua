-- Leader set to space
vim.g.mapleader = " "

-- Quitting
vim.keymap.set("n", "<leader><C-q><C-q>", "<cmd> q<CR>")
vim.keymap.set("n", "<leader><C-w><C-q>", "<cmd> wq<CR>")
vim.keymap.set("n", "<leader><C-x><C-q>", "<cmd> q!<CR>")

-- Writing
vim.keymap.set("n", "<leader><C-w>", "<cmd> w<CR>")

-- Split navigation
vim.keymap.set("n", "<C-w><C-w>", "<cmd> wincmd w<cr>")
vim.keymap.set("n", "<C-w><C-h>", "<cmd> wincmd h<cr>")
vim.keymap.set("n", "<C-w><C-j>", "<cmd> wincmd j<cr>")
vim.keymap.set("n", "<C-w><C-k>", "<cmd> wincmd k<cr>")
vim.keymap.set("n", "<C-w><C-l>", "<cmd> wincmd l<cr>")

-- Unhighlight everything (e.g. after searching)
vim.keymap.set("n", "<leader>nh", "/cLeAr_HiGhLiGhT<CR><cmd> NoiceDismiss<CR>")

-- Undo
vim.keymap.set("n", "U", vim.cmd.redo)

-- Substitute word under the cursor
vim.keymap.set("n", "<leader>s", [[:s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>S", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- To keep the cusor in the center while scrolling or navigating seatch results
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Paste without copying
vim.keymap.set("x", "<leader>p", "\"_dP")

vim.keymap.set("n", "x", "\"_x") -- delete letter without copying

-- Delete stuff without copying
vim.keymap.set("n", "<leader>d", "\"_d")
vim.keymap.set("v", "<leader>d", "\"_d")

-- Move lines/selection up or down
-- vim.keymap.set("n", "<C-j>", "v <cmd> m '>+1<CR>gv=gv<esc>")
-- vim.keymap.set("n", "<C-k>", "v <cmd> m '<-2<CR>gv=gv<esc>")
-- vim.keymap.set("v", "<C-j>", "<cmd> m '>+1<CR>gv=gv")
-- vim.keymap.set("v", "<C-k>", "<cmd> m '<-2<CR>gv=gv")


-- Noice
vim.keymap.set("n", "<leader>nm", function()
    local isInNoice = vim.bo.filetype == "noice"
    if (isInNoice) then
        vim.cmd "q"
    else
        vim.cmd "messages"
    end
end)

-- Netrw
local isLexOpen = false -- Store if the netrw drawer window is open
local isInNetrw = false -- Store is the current buffer is netrw
vim.keymap.set("n", "<leader>q", function()
    isInNetrw = (vim.bo.filetype == "netrw")

    if isLexOpen and isInNetrw then
        vim.cmd "Lex"
        vim.g.netrw_chgwin = -1
        vim.g.netrw_banner = 1
        isLexOpen = false
    end
    if isLexOpen and not isInNetrw then
        vim.cmd "wincmd h"
    end
    if not isLexOpen and not isInNetrw then
        vim.g.netrw_banner = 0
        vim.cmd "Lex %:p:h"
        isLexOpen = true
    end
end)
vim.keymap.set("n", "<leader>Q", function()
    isInNetrw = (vim.bo.filetype == "netrw")

    if isLexOpen then
        vim.cmd "Lex"
        vim.g.netrw_chgwin = -1
        vim.g.netrw_banner = 1
        isLexOpen = false
    elseif not isLexOpen and not isInNetrw then
        vim.g.netrw_chgwin = -1
        vim.g.netrw_banner = 1
        vim.cmd "Ex"
    end
end)


-- Plugin Remaps which cant be set in config (e.g. the plugin is lazy loaded)
vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle)
vim.keymap.set("n", "<leader>g", vim.cmd.Git)
