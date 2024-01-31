-- Turn on relative line numbers and absolute line numbers for the line in focus
vim.opt.relativenumber = true
vim.opt.number = true

-- Tabs = 4spaces
local spacesInTab = 4
vim.opt.expandtab = true
vim.opt.tabstop = spacesInTab
vim.opt.shiftwidth = spacesInTab
vim.opt.softtabstop = spacesInTab

-- Symbols for characters
vim.opt.listchars:append({ lead = "•" }) -- character for leading spaces
vim.opt.listchars:append({ tab = "◦◦" }) -- character for tabs
vim.opt.list = true -- turn on visual characters for some non-visible characters like spaces and tabs

-- Other Setup
vim.g.netrw_winsize = 20 -- netrw file drawer size
vim.opt.autoindent = true 
vim.opt.smartindent = true
vim.opt.wrapscan = true -- wrap searches around top/bottom of file
vim.opt.writebackup = false -- no tilde files
vim.opt.switchbuf = 'useopen' -- use an already open window if possible
vim.opt.splitright = true -- open vsplits in a more natural spot
vim.opt.textwidth = 0 -- never wrap lines
vim.opt.scrolloff = 10 -- start scrolling when within 10 lines near the top/bottom
