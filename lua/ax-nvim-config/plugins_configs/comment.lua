return function()
    require("Comment").setup({
        mappings = {
            basic = true,
            extra = false
        },
        toggler = {
            line = "<C-c><C-c>",     -- Toggle current line to comments and use single line comments
            block = "<C-x><C-x>"     -- Toggke current line to comments and use block/multi-line comments
        },
        opleader = {
            line = "<C-c>",          -- The leader key to use while using single line extra mappings (also in visual mode, this toggles single line comments)
            block = "<C-x>"          -- The leader key to use while using bloack line/multiline extra mappings (also in visual mode, this toggles block comments)
        }
    });
end
