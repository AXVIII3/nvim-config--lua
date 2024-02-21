local settings = require("settings");

vim.g.mapleader = settings.leader;                                                           -- Special key which can use used in keymaps

-- File Functions
vim.keymap.set("n", "<leader>WW", "<cmd> w<CR>");                                            -- For writing to the current buffer (saving)
vim.keymap.set("n", "<leader>QQ", "<cmd> q<CR>");                                            -- For quitting normally
vim.keymap.set("n", "<leader>WQ", "<cmd> wq<CR>");                                           -- For quitting after writing to the buffer
vim.keymap.set("n", "<leader>XQ", "<cmd> q!<CR>");                                           -- For quitting forcefully and discarding changes (if any

-- Text Editing
vim.keymap.set("n", "<leader>ch", ":silent! /ClEaR_hIgHlIgHtS<CR>");                                      -- Search for a random string so that the highlighting goes away
vim.keymap.set("n", "<leader>sw", [[:s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]]);    -- Substitute the word under the cursor
vim.keymap.set("n", "<leader>sW", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]]);   -- Substitute all the occurences of the word under the cursor
vim.keymap.set("x", "<leader>p", "\"_dP");                                                   -- Paste without copying the text which is being replaced
vim.keymap.set("n", "x", "\"_x");                                                            -- Don"t need to copy the words while deleting them
vim.keymap.set("n", "<leader>d", "\"_d");                                                    -- Delete without copying (normal mode)
vim.keymap.set("v", "<leader>d", "\"_d");                                                    -- Delete without copying (visual mode)
vim.keymap.set("n", "<leader>D", "\"_D");                                                    -- Delete without copying (everything after cursor)

-- Windows
vim.keymap.set("n", "+", [[<cmd>vertical resize +5<cr>]])                                    -- make the window biger vertically
vim.keymap.set("n", "_", [[<cmd>vertical resize -5<cr>]])                                    -- make the window smaller vertically
vim.keymap.set("n", "<M-=>", [[<cmd>horizontal resize +2<cr>]])                                  -- make the window bigger horizontally by pressing shift and =
vim.keymap.set("n", "<M-->", [[<cmd>horizontal resize -2<cr>]])                                  -- make the window smaller horizontally by pressing shift and -

-- Navigation
vim.keymap.set("n", "n", "nzzzv");                                                           -- Keep searched words in the center when navigating between them
vim.keymap.set("n", "N", "Nzzzv");                                                           -- Same as above (in the opposite direction)

-- Others
vim.keymap.set("n", "<leader>ms", "<cmd> messages<CR>");                                     -- Open all vim messages history
vim.keymap.set("n", "<leader>mtp", "<cmd> !md-to-pdf %:p %:p:h/%:t:r.pdf<cr>");
vim.keymap.set("n", "<leader>MTP", ":!md-to-pdf %:p %:p:h/%:t:r.pdf<left><left><left><left>");

-- TODO: Find a better way.... Kinda slow
-- Netrw
local isLexOpen = false;                                                                     -- Stores if the netrw drawer window is open
local isInNetrw = false;                                                                     -- Stores is the current buffer is netrw
vim.keymap.set("n", "<leader>e", function()
    isInNetrw = (vim.bo.filetype == "netrw");                                                -- Evaluate isInNetrw

    if isLexOpen and isInNetrw then                                                          -- If Netrw is open as a sidebar and is focused, then close it
        vim.cmd "Lex";                                                                       -- Netrw command to toggle in sidebar mode
        vim.g.netrw_chgwin = -1;                                                             -- Window number where file edits takes place (Lex sets this to 2)
        vim.g.netrw_banner = 1;                                                              -- The Netrw banner (Otherwise feels a bit empty in fullscreen)
        isLexOpen = false;                                                                   -- Lex is no longer open, remember that
    end
    if isLexOpen and not isInNetrw then                                                      -- If Netrw is open as a sidebar and not focused, focus on it
        vim.cmd "Lex";                                                                       -- Netrw command to toggle in sidebar mode
        vim.cmd "Lex %:p:h";                                                                 -- Netrw command to toggle in sidebar mode and open current file dir
    end
    if not isLexOpen and not isInNetrw then                                                  -- If Netrw is not open, open it in sidebar view
        vim.g.netrw_banner = 0;                                                              -- Banner takes too much space in sidebar mode (hide it)
        vim.cmd "Lex %:p:h";                                                                 -- Netrw command to toggle in sidebar mode and open current file dir
        isLexOpen = true;                                                                    -- Lex is now open, remember that
    end
end)
vim.keymap.set("n", "<leader>E", function()
    if isLexOpen then                                                                        -- If Netrw is open is sidebar view, close it
        vim.cmd "Lex";                                                                       -- Netrw command to toggle in sidebar mode
        vim.g.netrw_chgwin = -1;                                                             -- Window number where file edits takes place (Lex sets this to 2)
        vim.g.netrw_banner = 1;                                                              -- The Netrw banner (Otherwise feels a bit empty in fullscreen)
        isLexOpen = false;                                                                   -- Lex is no longer open, remember that
    else
        vim.g.netrw_chgwin = -1;                                                             -- Lex sets this to 2 which fucks up Ex, reset to 1
        vim.g.netrw_banner = 1;                                                              -- The Netrw banner (Otherwise feels a bit empty in fullscreen)
        vim.cmd "Ex";                                                                        -- Netrw command to open normally (full-screen)
    end
end)
