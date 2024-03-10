if pcall(require, "settings")  then
	_G.ax = require("settings");                                                           -- Turn my settings table into a globally accessible variable
else
	_G.ax = require("ax_config.setup.default_settings");                                   -- If settings not available use default settings
end

_G.map = function(mode, key, action, opt)                                                  -- Global function to map key in given mode
	vim.keymap.set(mode, key, action, opt);
end
_G.nmap = function(key, action, opt)                                                       -- Global function to map keys in normal mode
	vim.keymap.set("n", key, action, opt);
end

vim.api.nvim_create_augroup(ax.augroup_name, { clear = true });                            -- Create custom augroup to group together my custom auto commands

require("ax_config.setup.util");                                                           -- Set utility functions and variables
require("ax_config.setup.neovim_settings");                                                -- Set neovim specific options
require("ax_config.setup.neovim_keymaps");                                                 -- Set plugin non-dependent keymaps
require("ax_config.setup.package_manager");                                                -- Initialize the package manager
require("ax_config.setup.plugin_keymaps");                                                 -- Set plugin dependent keymaps
require("ax_config.setup.set_user_commands");                                              -- Set custom commands
