-- Currently using folke/lazy.nvim as package manager

-- Bootstapping Lazy so that it gets installed if it isnt already
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable",
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

-- Setting up Lazy
-- Plugins are downloaded setup in the seperate plugins/ directory
require("lazy").setup("axviii3.plugins")
