-- Editor Settings
vim.opt.number = true;                                                                     -- Turn on normal line number for current line
vim.opt.relativenumber = true;                                                             -- Turn on relative line numbers
vim.opt.wrap = false;                                                                      -- Turns off text wrapping
vim.opt.textwidth = 0;                                                                     -- Number of lines that can be displayed before wrapping (0 for infinite)
vim.opt.termguicolors = true;                                                              -- Enable 24-bit colors (basically better colors)
vim.opt.splitright = true;                                                                 -- Open new vertical splits on the right side (more natural)
vim.opt.scrolloff = 4;                                                                     -- Keep a gap of 10 lines on the top and bottom of the screen while scrolling if available
vim.opt.signcolumn = "yes";                                                                -- A column on the left side of the editor to display code symbols
if ax.should_column_be_visible_by_default then
	vim.opt.colorcolumn = ax.column_width;                                                 -- A vertical line at a column width to help in keeping text length on check
vim.cmd('autocmd FileType netrw setlocal colorcolumn&');                                   -- Turn off coloured column in netrw
vim.cmd('autocmd FileType help setlocal colorcolumn&');                                    -- Turn off coloured column in help pages
end
vim.opt.laststatus = 3;                                                                    -- One global status line for all active windows

-- Utilities
vim.opt.shell = "pwsh";                                                                    -- Set default shell to powershell
vim.opt.completeopt = { "menu", "menuone", "noselect", "preview" };                        -- Completion popup style (kinda)
vim.opt.clipboard = "unnamedplus";                                                         -- Use the system clipboard buffer by default 
vim.opt.incsearch = true;                                                                  -- Update seach while the search if happening
vim.opt.wrapscan = true;                                                                   -- Wrap around the buffer while searching
vim.opt.whichwrap:append("h");                                                             -- Wrap to line above when at the start of a line and pressed h (left)
vim.opt.whichwrap:append("l");                                                             -- Wrap to line below when at the end of a line and pressed l (right)
vim.g.netrw_winsize = 20;                                                                  -- Default size of the Netrw explorer when not in full-screen mode
vim.api.nvim_create_autocmd("TextYankPost", {                                              -- Event called when any text is yanked
	pattern = "*",
	callback = function()                                                                  -- Highlihght the yanked text for the duration of timeout
		vim.highlight.on_yank({
			higroup = "IncSearch", timeout = 500                                           -- IncSearch is the higlight group for searching
		});
	end
});

-- Tabs and Spaces
vim.opt.expandtab = false;                                                                 -- Dont use actual spaces instead of tab characters
vim.opt.tabstop = 4;                                                                       -- Number of spaces a tab counts for
vim.opt.shiftwidth = 4;                                                                    -- IDK what this is for sure but similar to tabstop
vim.opt.softtabstop = 4;                                                                   -- Number of spaces a tab coutns for while performing editing operations
vim.opt.autoindent = true;                                                                 -- Copy indenting from the current line to the next line
vim.opt.smartindent = true;                                                                -- Smartly indent the next line based on current line and scope (ig?)

-- Non-Text Chracters
vim.opt.listchars = {};                                                                    -- Empty the default character list
vim.opt.listchars:append({ lead = "·" });                                                  -- Replaces leading spaces with character
vim.opt.listchars:append({ tab = "▎·" });                                                  -- Replaces tabs with character(s)
vim.opt.listchars:append({ trail = "◡" });                                                 -- Replaces trailing spaces with character
vim.opt.list = true;                                                                       -- Actualy turn on this feature

-- Backup and Storing
vim.opt.swapfile = false                                                                   -- Dont use a swapfile for the buffer (whatever that is)
vim.opt.backup = false                                                                     -- Dont create backups of files
vim.opt.writebackup = false                                                                -- Dont create a backup of the file before overriing it
vim.opt.undofile = true                                                                    -- Store all undos in a buffer to a file persistently
vim.opt.undodir = ax.undo_files_directory;                                                 -- Sets the directory to store undofile in
