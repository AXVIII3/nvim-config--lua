return function()
    vim.g.vimwiki_list = {
        {
            path = require("settings").wikidir,
            syntax = 'markdown',
            ext = '.md',
        },
    }

    vim.g.vimwiki_ext2syntax = {
        ['.md'] = 'markdown',
        ['.markdown'] = 'markdown',
        ['.mdown'] = 'markdown',
    }

    vim.g.vimwiki_global_ext = 0                   -- don't treat all md files as vimwiki (0)
    vim.g.vimwiki_hl_headers = 1                   -- use alternating colours for different heading levels
    vim.g.vimwiki_markdown_link_ext = 1            -- add markdown file extension when generating links
    vim.g.taskwiki_markdown_syntax = "markdown"
end