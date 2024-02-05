require("axviii3.remaps")
require("axviii3.package_manager")
require("axviii3.setup")

-- Open in Netrw unless a file is opened via arguments
if not (vim.fn.argc() > 0) then
    vim.cmd "Ex"
end
