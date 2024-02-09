return function()
    require("noice").setup({
        cmdline = {
            enabled = true,
            view = "cmdline",
        },
        popupmenu = { enabled = false, },
        notify = {
            enabled = true,
            view = "notify",
        },
        presets = {
            bottom_search = true,
            long_message_to_split = true, -- long messages will be sent to a split
            lsp_doc_border = true, -- add a border to hover docs and signature help
        },
    });
end
