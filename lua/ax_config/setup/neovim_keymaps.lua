vim.g.mapleader = " ";                                                                     -- Map global leader to space
vim.g.maplocalleader = " ";                                                                -- Map local leader to space

-- File Functions
nmap(
	"<leader>WW",
	"<cmd> w<CR>",
	{ desc = ax.format_keymap_desc("Write to file (save)", false, "File") }
);                                                                                         -- For writing to the current buffer (saving)
nmap(
	"<leader>QQ",
	"<cmd> q<CR>",
	{ desc = ax.format_keymap_desc("Quit vim", false, "File") }
);                                                                                         -- For quitting normally
nmap(
	"<leader>WQ",
	"<cmd> wq<CR>",
	{ desc = ax.format_keymap_desc("Write and quite", false, "File") }
);                                                                                         -- For quitting after writing to the buffer
nmap(
	"<leader>XQ",
	"<cmd> q!<CR>",
	{ desc = ax.format_keymap_desc("Force quit without saving", false, "File") }
);                                                                                         -- For quitting forcefully and discarding changes (if any
table.insert(ax.keymap_categories, ax.format_keymap_desc("File", false));






-- Text Editing
nmap(
	"<leader>ch",
	function() ax.clear_highlights() end,
	{ desc = ax.format_keymap_desc("Clear highlights", false, "Text Editing") }
);                                                                                         -- Search for a random string so that the highlighting goes away
nmap(
	"<leader>sw",
	[[:s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
	{ desc = ax.format_keymap_desc("Substitute the word under cursor", false,
									"Text Editing") }
);                                                                                         -- Substitute the word under the cursor
nmap(
	"<leader>sW",
	[[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
	{ desc = ax.format_keymap_desc("Substitute all occurences of the word under cursor",
									false, "Text Editing") }
);                                                                                         -- Substitute all the occurences of the word under the cursor
nmap(
	"<leader>p",
	"\"_dP",
	{ desc = ax.format_keymap_desc("Paste without copying replaced text", false,
									"Text Editing") }
);                                                                                         -- Paste without copying the text which is being replaced
nmap(
	"<leader>P",
	"yyp",
	{ desc = ax.format_keymap_desc("Duplicate down", false, "Text Editing") }
);                                                                                         -- Copy down to the next line
nmap(
	"x",
	"\"_x",
	{ desc = ax.format_keymap_desc("Delete word (without copying)", false,
									"Text Editing") }
);                                                                                         -- Don"t need to copy the words while deleting them
map(
	"v",
	"<leader>d",
	"\"_d",
	{ desc = ax.format_keymap_desc("Delete without copying (visual mode)", false,
									"Text Editing") }
);                                                                                         -- Delete without copying (normal mode)
nmap(
	"<leader>d",
	"\"_d",
	{ desc = ax.format_keymap_desc("Delete without copying (normal mode)", false,
									"Text Editing") }
);                                                                                         -- Delete without copying (visual mode)
nmap(
	"dW",
	"bdw",
	{ desc = ax.format_keymap_desc("Delete the whole word under cursor", false,
									"Text Editing") }
);                                                                                         -- Delete word from anywhere inside the word
nmap(
	"<leader>dW",
	"b\"_dw",
	{ desc = ax.format_keymap_desc("Delete whole word under cursor without copying",
									false, "Text Editing") }
);                                                                                         -- Delete word from anywhere inside the word without copying
nmap(
	"<leader>D",
	"\"_D",
	{ desc = ax.format_keymap_desc("Delete everything after cursor without copying",
									false, "Text Editing") }
);                                                                                         -- Delete without copying (everything after cursor)
nmap(
	"<leader>o",
	"o<esc>",
	{ desc = ax.format_keymap_desc("Create new line below and return to normal mode",
									false, "Text Editing") }
);                                                                                         -- Create new line below and return to normal mode
nmap(
	"<leader>O",
	"O<esc>",
	{ desc = ax.format_keymap_desc("Create new line above and return to normal mode",
									false, "Text Editing") }
);                                                                                         -- Create new line above and return to normal mode
table.insert(ax.keymap_categories, ax.format_keymap_desc("Text Editing", false));






-- Windows
nmap(
	"+",
	[[<cmd>vertical resize +2<cr>]],
	{ desc = ax.format_keymap_desc("Increase window size vertically", false,
									"Window Resizing") }
);                                                                                         -- Make the window biger vertically
nmap(
	"_",
	[[<cmd>vertical resize -2<cr>]],
	{ desc = ax.format_keymap_desc("Decrease window size vertically", false,
									"Window Resizing") }
);                                                                                         -- Make the window smaller vertically
nmap(
	"<M-=>",
	[[<cmd>horizontal resize +2<cr>]],
	{ desc = ax.format_keymap_desc("Increase window size horizontally", false,
									"Window Resizing") }
);                                                                                         -- Make the window bigger horizontally
nmap(
	"<M-->",
	[[<cmd>horizontal resize -2<cr>]],
	{ desc = ax.format_keymap_desc("Decrease window size horizontally", false,
									"Window Resizing") }
);                                                                                         -- Make the window smaller horizontally
table.insert(ax.keymap_categories, ax.format_keymap_desc("Window Resizing", false));






-- Navigation
nmap(
	"n",
	"nzzzv",
	{ desc = ax.format_keymap_desc("Go to next serch item", false, "Search Navigation") }
);                                                                                         -- Keep searched words in the center when navigating between them
nmap(
	"N",
	"Nzzzv",
	{ desc = ax.format_keymap_desc("Go to previous search item", false,
									"Search Navigation") }
);                                                                                         -- Same as above (in the opposite direction)
table.insert(ax.keymap_categories, ax.format_keymap_desc("Search Navigation", false));






-- Others
nmap(
	"<leader>ms",
	"<cmd> messages<CR>",
	{ desc = ax.format_keymap_desc("Open neovim messages/notifications", false,
									"Others") }
);                                                                                         -- Open all vim messages history

nmap(
	"<leader>cc",
	function() ax.toggle_color_column() end,
	{ desc = ax.format_keymap_desc("Toggle color column", false, "Others") }
);

if ax.should_setup_pandoc_command then
	nmap(
		"<leader>mtp",
		"<cmd>" .. ax.pandoc_command_quick,
		{ desc = ax.format_keymap_desc("Quick convert md to pdf using pandoc",
										false, "Others") }
	);                                                                                     -- Quickly convert markdown to pdf
	nmap(
		"<leader>MTP",
		function()
		vim.ui.input(
			{ prompt = "Enter pdf file name: " },
			function(input)
				if not (input == nil) then
					vim.cmd(ax.pandoc_command:gsub("{name}", input));
				end
			end
		);
		end,
		{ desc = ax.format_keymap_desc("Convert md to pdf using pandoc", false,
										"Others") }
	);                                                                                     -- Convert markdown to pdf and lemme choose a file name for it
end

nmap(
	"<leader>in",
	function() ax.change_indent_style() end,
	{ desc = ax.format_keymap_desc("Change indent style", false, "Others") }
);

table.insert(ax.keymap_categories, ax.format_keymap_desc("Others", false));






-- Netrw
local is_lex_open = false;                                                                 -- Stores if the netrw drawer window is open
local is_in_netrw = false;                                                                 -- Stores is the current buffer is netrw
nmap(
	"<leader>e",
	function()
		is_in_netrw = (vim.bo.filetype == "netrw");                                        -- If NetRw is open or not

		if is_lex_open and is_in_netrw then                                                -- If Netrw is open as a sidebar and is focused, then close it
			vim.cmd "Lex";                                                                 -- Netrw command to toggle in sidebar mode
			vim.g.netrw_chgwin = -1;                                                       -- Window number where file edits takes place (Lex sets this to 2)
			vim.g.netrw_banner = 1;                                                        -- The Netrw banner (Otherwise feels a bit empty in fullscreen)
			is_lex_open = false;                                                           -- Lex is no longer open, remember that
		end
		if is_lex_open and not is_in_netrw then                                            -- If Netrw is open as a sidebar and not focused, focus on it
			vim.cmd "Lex";                                                                 -- Netrw command to toggle in sidebar mode
			vim.cmd "Lex %:p:h";                                                           -- Netrw command to toggle in sidebar mode and open current file dir
		end
		if not is_lex_open and not is_in_netrw then                                        -- If Netrw is not open, open it in sidebar view
			vim.g.netrw_banner = 0;                                                        -- Banner takes too much space in sidebar mode (hide it)
			vim.cmd "Lex %:p:h";                                                           -- Netrw command to toggle in sidebar mode and open current file dir
			is_lex_open = true;                                                            -- Lex is now open, remember that
		end
	end,
	{ desc = ax.format_keymap_desc("Toggle sidebar netrw", false, "NetRw") }
);
nmap(
	"<leader>E",
	function()
		is_in_netrw = (vim.bo.filetype == "netrw");                                        -- If NetRw is open or not

		if is_lex_open then                                                                -- If Netrw is open is sidebar view, close it
			vim.cmd "Lex";                                                                 -- Netrw command to toggle in sidebar mode
			vim.g.netrw_chgwin = -1;                                                       -- Window number where file edits takes place (Lex sets this to 2)
			vim.g.netrw_banner = 1;                                                        -- The Netrw banner (Otherwise feels a bit empty in fullscreen)
			is_lex_open = false;                                                           -- Lex is no longer open, remember that
		elseif is_in_netrw then
			vim.g.netrw_chgwin = -1;                                                       -- Lex sets this to 2 which fucks up Ex, reset to 1
			vim.g.netrw_banner = 1;                                                        -- The Netrw banner (Otherwise feels a bit empty in fullscreen)
			vim.cmd("Rex");                                                                -- Go back to file from where netrw was opened
		else
			vim.g.netrw_chgwin = -1;                                                       -- Lex sets this to 2 which fucks up Ex, reset to 1
			vim.g.netrw_banner = 1;                                                        -- The Netrw banner (Otherwise feels a bit empty in fullscreen)
			vim.cmd("Ex");                                                                 -- Netrw command to open normally (full-screen)
		end
	end,
	{ desc = ax.format_keymap_desc("Toggle fullscreen netrw explorer or close sidebar",
									false, "NetRw") }
);
table.insert(ax.keymap_categories, ax.format_keymap_desc("NetRw", false));


-- LSP
vim.api.nvim_create_autocmd("LspAttach", {
	group = ax.augroup_name,
	callback = function(ev)
		nmap(
			"K",
			vim.lsp.buf.hover,
			{
				buffer = ev.buf,
				desc = ax.format_keymap_desc("Display hover information", false,
											"L.S.P.")
			}
		);
		nmap(
			"<leader>k",
			vim.lsp.buf.signature_help,
			{
				buffer = ev.buf,
				desc = ax.format_keymap_desc("Show signature information", false,
											"L.S.P.")
			}
		);
		nmap(
			"gD",
			vim.lsp.buf.declaration,
			{
				buffer = ev.buf,
				desc = ax.format_keymap_desc("Goto declaration", false, "L.S.P.")
			}
		);
		nmap(
			"gt",
			"<cmd>Trouble lsp_type_definitions<CR>",
			{
				buffer = ev.buf,
				desc = ax.format_keymap_desc("Goto type definition", false, "L.S.P.")
			}
		);
		nmap(
			"gi",
			vim.lsp.buf.implementation,
			{
				buffer = ev.buf,
				desc = ax.format_keymap_desc("Goto implementation", false, "L.S.P.")
			}
		);
		nmap(
			"gr",
			"<cmd>Telescope lsp_references<CR>",
			{
				buffer = ev.buf,
				desc = ax.format_keymap_desc("List references in telescope UI",
											false, "L.S.P.")
			}
		);
		nmap(
			"]d",
			vim.diagnostic.goto_next,
			{
				buffer = ev.buf,
				desc = ax.format_keymap_desc("Goto next diagnostic", false, "L.S.P.")
			}
		);
		nmap(
			"[d",
			vim.diagnostic.goto_prev,
			{
				buffer = ev.buf,
				desc = ax.format_keymap_desc("Goto previous diagnostic", false,
											"L.S.P.")
			}
		);
		nmap(
			"<leader>ca",
			vim.lsp.buf.code_action,
			{
				buffer = ev.buf,
				desc = ax.format_keymap_desc("List code actions", false, "L.S.P.")
			}
		);
		nmap(
			"<F2>",
			vim.lsp.buf.rename,
			{
				buffer = ev.buf,
				desc = ax.format_keymap_desc("Rename symbol under cursor", false,
											"L.S.P.")
			}
		);
		nmap(
			"<leader>rn",
			vim.lsp.buf.rename,
			{
				buffer = ev.buf,
				desc = ax.format_keymap_desc("Rename symbol under cursor", false,
											"L.S.P.")
			}
		);
		nmap(
			"<leader>F",
			function() vim.lsp.buf.format({ async = true }) end,
			{
				buffer = ev.buf,
				desc = ax.format_keymap_desc("Format file", false, "L.S.P.")
			}
		);
	end
});
table.insert(ax.keymap_categories, ax.format_keymap_desc("L.S.P.", false));
