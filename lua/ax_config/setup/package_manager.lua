-- Setup a package manager to download and configure plugins
-- Current Using Lazy.nvim by Folke

-- Install and Bootstrap lazy
local lazyDataPath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim";                          -- The path where lazy is to be installed
if not vim.loop.fs_stat(lazyDataPath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",                                                                 -- Clone the lazy package manager
		lazyDataPath                                                                       -- Into the lazy directory
	});
end
vim.opt.rtp:prepend(lazyDataPath);                                                         -- Add lazy to the run time paths

-- Configure and Start Lazy
require("lazy").setup("ax_config.plugins", {
	checker = {
		enabled = true,                                                                    -- Automatically check for plugin updates
		notify = false                                                                     -- But don't notfy me about it
	},
	install = { colorscheme = { "onedark", "habamax" } },
	change_detection = { notify = false }                                                  -- I know I made a change to the config, shut up
});
