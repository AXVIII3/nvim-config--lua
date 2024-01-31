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
vim.opt.listchars = {}
vim.opt.listchars:append({ lead = "•" })
vim.opt.listchars:append({ tab = "◦◦" })
vim.opt.listchars:append({ trail = "◡" })
vim.opt.list = true -- turn on visual characters for some non-visible characters like spaces and tabs

-- Other Setup
vim.opt.clipboard = "unnamedplus" -- use system clipboard as buffer
vim.opt.incsearch = true -- update result as the search is happening instead of after
vim.g.netrw_winsize = 20 -- netrw file drawer size
vim.opt.autoindent = true -- auto indents code on actions
vim.opt.smartindent = true -- smartly indents new lines
vim.opt.wrapscan = true -- wrap searches around top/bottom of file
vim.opt.writebackup = false -- no tilde files
vim.opt.switchbuf = 'useopen' -- use an already open window if possible
vim.opt.splitright = true -- open vsplits in a more natural spot
vim.opt.textwidth = 0 -- never wrap lines
vim.opt.scrolloff = 10 -- start scrolling when within 10 lines near the top/bottom
