-- Turn on relative line numbers and absolute line numbers for the line in focus
vim.opt.relativenumber = true
vim.opt.number = true

-- Motion wrapping
vim.opt.whichwrap:append("h")
vim.opt.whichwrap:append("l")

-- Tabs = 4spaces
local spacesInTab = 4
vim.opt.expandtab = true
vim.opt.tabstop = spacesInTab
vim.opt.shiftwidth = spacesInTab
vim.opt.softtabstop = spacesInTab
vim.opt.autoindent = true -- auto indents code on actions
vim.opt.smartindent = true -- smartly indents new lines

-- No text wrapping
vim.opt.wrap = false
vim.opt.textwidth = 0 -- never wrap lines

-- Backup and Storing
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.writebackup = false -- no tilde files
vim.opt.undodir = "G:/_OTHERS/nvim-data/undo_dir"
vim.opt.undofile = true -- store persistant undo files

-- Searching
vim.opt.incsearch = true -- update result as the search is happening instead of after
vim.opt.wrapscan = true -- wrap searches around top/bottom of file

-- Symbols for characters
vim.opt.listchars = {} -- clear defaults
vim.opt.listchars:append({ lead = "•" }) -- leading spaces get converted to
vim.opt.listchars:append({ tab = "◦◦" }) -- tabs get converted to
vim.opt.listchars:append({ trail = "◡" }) -- trailiing spaces get converted to
vim.opt.list = true -- turn on visual characters for some non-visible characters like spaces and tabs

-- Other Setup
vim.g.netrw_winsize = 20 -- netrw file drawer size
vim.opt.termguicolors = true -- better colors
vim.opt.clipboard = "unnamedplus" -- use system clipboard as buffer
vim.opt.switchbuf = 'useopen' -- use an already open window if possible
vim.opt.splitright = true -- open vsplits in a more natural spot
vim.opt.scrolloff = 10 -- start scrolling when within 10 lines near the top/bottom
vim.opt.signcolumn = "yes" -- a gap towards the left where code signs can be displayed
