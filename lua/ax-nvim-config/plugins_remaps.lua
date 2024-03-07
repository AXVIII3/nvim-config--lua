-- NOTE: Treesitter and CMP keybindings had to be set from config

-- ESSENTIALS ----------------------------------------------------------------------------------------

-- Undotree -----
local wasUndotreeOpen = false;
vim.keymap.set("n", "<leader>u", function()
    vim.cmd "UndotreeToggle";
    wasUndotreeOpen = (not wasUndotreeOpen);
    if wasUndotreeOpen then
        vim.cmd "UndotreeFocus";
    end
end);                                                                                                            -- Toggles the undotree window

-- Harpoon -----
local harpoon = require("harpoon")
vim.keymap.set("n", "<leader>a", function() harpoon:list():append() end);                                        -- Add current file to harpoon
vim.keymap.set("n", "<C-h>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end);                       -- Open harpoon list
vim.keymap.set("n", "<leader>1", function() harpoon:list():select(1) end);                                       -- Switch to 1st file in harpoon
vim.keymap.set("n", "<leader>2", function() harpoon:list():select(2) end);                                       -- Switch to 2nd file in harpoon
vim.keymap.set("n", "<leader>3", function() harpoon:list():select(3) end);                                       -- Switch to 3rd file in harpoon
vim.keymap.set("n", "<leader>4", function() harpoon:list():select(4) end);                                       -- Switch to 4th file in harpoon
vim.keymap.set("n", "<leader>5", function() harpoon:list():select(5) end);                                       -- Switch to 5th file in harpoon
vim.keymap.set("n", "<leader>6", function() harpoon:list():select(6) end);                                       -- Switch to 6th file in harpoon
vim.keymap.set("n", "<leader>7", function() harpoon:list():select(7) end);                                       -- Switch to 7th file in harpoon
vim.keymap.set("n", "<leader>8", function() harpoon:list():select(8) end);                                       -- Switch to 8th file in harpoon
vim.keymap.set("n", "<leader>Q", function() harpoon:list():prev() end);                                          -- Goto to previous file in harpoon list
vim.keymap.set("n", "<leader>q", function() harpoon:list():next() end);                                          -- Goto to next file in harpoon list

-- Telescope -----
local builtin = require("telescope.builtin");
vim.keymap.set("n", "<leader>ff", builtin.find_files, {});                                                       -- Open fuzzy finder
vim.keymap.set("n", "<leader>fg", builtin.git_files, {});                                                        -- Open only git files in fuzzy finder
vim.keymap.set("n", "<leader>fw", function() builtin.grep_string({ search = vim.fn.expand("<cword>") }) end);    -- Search for word under cursor
vim.keymap.set("n", "<leader>fW", function() builtin.grep_string({ search = vim.fn.expand("<cWORD>") }) end);    -- Search of whole un-spaced text under cursor (this.count:for-this)
vim.keymap.set("n", "<leader>fs", function() builtin.grep_string({ search = vim.fn.input("Grep > ") }) end);     -- Search for a word using grep
vim.keymap.set("n", "<leader>tn", "<cmd> Telescope noice<CR>");                                                  -- Open noice messages in telescope
vim.keymap.set("n", "<leader>fn", "<cmd> GetCurrentFunctions<CR>");                                              -- Open all functions in current file with telescope
vim.keymap.set("n", "<leader>le", "<cmd> Telescope diagnostics<CR>");                                            -- Open all functions in current file with telescope



-- QUALITY OF LIFE -----------------------------------------------------------------------------------

-- Multiple Cursors -----
vim.keymap.set("n", "<C-j>", "<Cmd>MultipleCursorsAddDown<CR>");                                                 -- Add cursor below current position
vim.keymap.set("n", "<C-k>", "<Cmd>MultipleCursorsAddUp<CR>");                                                   -- Add cursor above current position
vim.keymap.set("n", "<C-LeftMouse>", "<Cmd>MultipleCursorsMouseAddDelete<CR>");                                  -- Add cursor with mouse click (normal mode)
vim.keymap.set("i", "<C-LeftMouse>", "<Cmd>MultipleCursorsMouseAddDelete<CR>");                                  -- Add cursor with mouse click (insert mode)

-- Comments -----
local api = require("Comment.api");
local esc = vim.api.nvim_replace_termcodes("<ESC>", true, false, true);
vim.keymap.set("n", "<C-c><C-c>", api.toggle.linewise.current);                                                  -- Toggle current line (linewise)
vim.keymap.set("n", "<C-x><C-x>", api.toggle.blockwise.current);                                                 -- Toggle current line (blockwise)
vim.keymap.set("n", "<leader>gc", api.call("toggle.linewise", "g@"), { expr = true });                           -- Toggle lines (linewise) with dot-repeat support
vim.keymap.set("n", "<leader>gb", api.call("toggle.blockwise", "g@"), { expr = true });                          -- Toggle lines (blockwise) with dot-repeat support
vim.keymap.set("x", "<C-c>",
    function()                                                                                                   -- Toggle selection (linewise)
        vim.api.nvim_feedkeys(esc, "nx", false);
        api.toggle.linewise(vim.fn.visualmode());
    end);
vim.keymap.set("x", "<C-x>",
    function()                                                                                                   -- Toggle selection (blockwise)
        vim.api.nvim_feedkeys(esc, "nx", false);
        api.toggle.blockwise(vim.fn.visualmode());
    end);



-- IDE FEATURES --------------------------------------------------------------------------------------

-- LSP -----
vim.api.nvim_create_autocmd("LspAttach", {
    group = require("settings").augroupname,
    callback = function(ev)
        local options = { buffer = ev.buf };
        vim.keymap.set("n", "K", vim.lsp.buf.hover, options);
        vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, options);
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, options);
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, options);
        vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, options);
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, options);
        vim.keymap.set("n", "gr", vim.lsp.buf.references, options);
        vim.keymap.set("n", "gR", "<cmd> Telescope lsp_references<cr>", options);
        vim.keymap.set("n", "]d", vim.diagnostic.goto_next, options);
        vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, options);
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, options);
        vim.keymap.set("n", "<F2>", vim.lsp.buf.rename, options);
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, options);
        vim.keymap.set("n", "<leader>F", function()
            vim.lsp.buf.format({ async = true });
        end, options);
    end
});

-- DAP -----
local dap = require("dap");
dap.listeners.before["initialized"][require("settings").augroupname] = function()
    print("dap")
    vim.keymap.set("n", "<F3>", function() dap.toggle_breakpoint() end);
    vim.keymap.set("n", "<F4>", function() dap.set_breakpoint(vim.fn.input("Breakpoint Condition: ")) end);
    vim.keymap.set("n", "<F5>", function() dap.continue() end);
    vim.keymap.set("n", "<F6>", function() dap.step_over() end);
    vim.keymap.set("n", "<F7>", function() dap.step_into() end);
    vim.keymap.set("n", "<F8>", function() dap.step_out() end);
    vim.keymap.set("n", "<F9>", function() dap.set_breakpoint(nil, nil, vim.fn.input("Log point message: ")) end);
    vim.keymap.set("n", "<F10>", function() dap.repl.open() end);
end
dap.listeners.before.attach.dapui_config = function()
    vim.keymap.set("n", "<leader>du", function() require("dapui").toggle() end, { buffer = 0 });
end



-- OTHERS --------------------------------------------------------------------------------------------

-- Cloak -----
vim.keymap.set("n", "<leader>ct", "<cmd> CloakToggle<CR>");                                                       -- Toggles cloak"s hiding

-- Color Picker -----
vim.keymap.set("n", "<C-c><C-p>", "<cmd>PickColor<cr>");
vim.keymap.set("n", "<leader>cp", "<cmd>PickColor<cr>");
vim.keymap.set("i", "<C-c><C-p>", "<cmd>PickColorInsert<cr>");
