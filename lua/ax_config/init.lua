if pcall(require, "settings")  then
	_G.ax = require("settings");                                                           -- Turn my settings table into a globally accessible variable
else
	_G.ax = require("ax_config.setup.default_settings");                                   -- If settings not available use default settings
end

vim.api.nvim_create_augroup(ax.augroup_name, { clear = true });                            -- Create custom augroup to group together my custom auto commands

require("ax_config.setup.neovim_settings");                                                -- Set neovim specific options
require("ax_config.setup.package_manager");                                                -- Initialize the package manager
