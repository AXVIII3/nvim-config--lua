return function()
    require("mini.move").setup({
        mappings = {
            down = "<C-j>",                                              -- Move current line down in Visual mode
            up = "<C-k>",                                                -- Move current line up in Visual mode

            line_down = "<C-j>",                                         -- Move current line down in Normal mode
            line_up = "<C-k>",                                           -- Move current line up in Normal mode
        },
        options = { reindent_linewise = tue },                           -- Automatically reindent selection during linewise vertical move
    });
end
