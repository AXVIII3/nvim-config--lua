vim.api.nvim_create_augroup(require("settings").augroupname, { clear = true });              -- Create a auto command group for future use
if (vim.fn.argc() <= 0) then                                                                 -- If there are no arguments
        vim.api.nvim_create_autocmd("VimEnter", {                                            -- Then open Netrw explorer when Vim loads
            command = "Ex",
            group = require("settings").augroupname
        });
end

require("ax-nvim-config.nvim_settings");                                                     -- Load vanilla neovim settings
require("ax-nvim-config.nvim_remaps");                                                       -- Load vanilla neovim remaps
require("ax-nvim-config.package_manager");                                                   -- Load package manager which loads olugins and stuff
