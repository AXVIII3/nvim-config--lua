return function()
    require("staline").setup({
        sections = {
            left = {
                " ", "right_sep", "-mode", "left_sep", " ",
                "right_sep", "-file_name", "left_sep", " ",
            },
            mid  = { "lsp" },
            right =  {
                "right_sep", "- ", function() return { "StalineFill", vim.bo.filetype:lower() } end, "- ", "left_sep", " ",
                "right_sep", "-line_column", "left_sep", " ",
            }
        },

        special_table = {
            netrw = { "", "" },
            help = { (("━"):rep(vim.o.columns / 2 - 3) .. " Help " .. ("━"):rep(vim.o.columns / 2 - 3)), "" },
            undotree = { (("━"):rep(vim.o.columns / 2 - 5) .. " Undotree " .. ("━"):rep(vim.o.columns / 2 - 5)), "" },
            diff = { (("━"):rep(vim.o.columns / 2 - 3) .. " Diff " .. ("━"):rep(vim.o.columns / 2 - 3)), "" },
        },

        defaults = {
            fg = "#181a1f",
            left_separator = "",
            right_separator = "",
            true_colors = true,
            line_column = "%l:%c ~ %p%%",
        },

        mode_colors = {
            ["n"]  = "#98c379",
            ["c"]  = "#61afef",
            ["i"]  = "#d19a66",
            ["ic"] = "#181a23",
            ["s"]  = "#123456",
            ["S"]  = "#000000",
            ["v"]  = "#c678dd",
            ["V"]  = "#9a6dd1",
            [""] = "#8068de",
            ["t"]  = "#ffffff",
            ["r"]  = "#971034",
            ["R"]  = "#546576"
        },

        mode_icons = {
            ["n"]    = "Normal",
            ["no"]   = "no",
            ["niI"]  = "niI",
            ["niR"]  = "niR",
            ["no"] = "no^V",
            ["niV"]  = "niV",
            ["nov"]  = "nov",
            ["noV"]  = "noV",
            ["i"]    = "Insert",
            ["ic"]   = "ic",
            ["ix"]   = "ix",
            ["s"]    = "s",
            ["S"]    = "S",
            ["v"]    = "Visual",
            ["V"]    = "Visual Line",
            [""]   = "Visual Block",
            ["r"]    = "r",
            ["r?"]   = "r?",
            ["c"]    = "c",
            ["t"]    = "t",
            ["!"]    = "!",
            ["R"]    = "R"
        },
    });
end
