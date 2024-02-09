print("Welcome to NEOVIM! Happy Coding.");                                                   -- Startup message
vim.cmd "messages";                                                                          -- Actually show the message (IDK why it doesn't show up otherwise)

local augroupname = require("settings").augroupname;                                         -- Custom user auto command group name
vim.api.nvim_create_augroup(augroupname, { clear = true });                                  -- Create a auto command group for future use
if (vim.fn.argc() <= 0) then                                                                 -- If there are no arguments
        vim.api.nvim_create_autocmd("VimEnter", { command = "Ex", group = augroupname });    -- Then open Netrw explorer when Vim loads
end

require("ax-nvim-config.nvim_settings");                                                     -- Load vanilla neovim settings
require("ax-nvim-config.nvim_remaps");                                                       -- Load vanilla neovim remaps
require("ax-nvim-config.package_manager");                                                   -- Load package manager which loads olugins and stuff
