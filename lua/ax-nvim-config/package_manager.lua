-- Setup a package manager to download and configure plugins
-- Using: Fokle/Lazy.nvim

local lazyDataPath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim";                                                 -- The path where lazy is to be installed
if not vim.loop.fs_stat(lazyDataPath) then
    vim.fn.system({
        "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable",        -- Clone the lazy package manager
        lazyDataPath                                                                                              -- Into the lazy directory
    });
end
vim.opt.rtp:prepend(lazyDataPath);                                                                                -- Add lazy to the run time paths



require("lazy").setup("ax-nvim-config.plugins", {                                                                 -- Configure and start lazy
    lazy = false,                                                                                                 -- Don't lazy load shit
    checker = {
        enabled = true,                                                                                           -- Automatically check for plugin updates
        notify = false                                                                                            -- But don't notfy me about it
    },
    change_detection = { notify = false }                                                                         -- I know I made a change to the config, shut up
});



vim.api.nvim_create_autocmd("VimEnter", {                                                                         -- Configure keymaps for installed plugins
    callback = function() require("ax-nvim-config.plugins_remaps") end,
    group = require("settings").augroupname
});
