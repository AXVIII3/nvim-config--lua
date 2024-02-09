-- If there are no arguments (no file or folder is passed as an argument to open)
if (vim.fn.argc() <= 0) then
    -- Then open Netrw explorer when Vim loads (and so does Netrw)
    vim.api.nvim_create_autocmd("VimEnter", { command = "Ex" });
end

require("ax-nvim-config.nvim_settings")
require("ax-nvim-config.nvim_remaps")
require("ax-nvim-config.package_manager")
