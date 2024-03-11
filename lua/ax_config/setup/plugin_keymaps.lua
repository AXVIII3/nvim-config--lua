local is_undotree_open = false;

local set_mappings = function()
	-- Dashboard
	nmap(
		"<leader>db",
		"<cmd>Dashboard<CR>",
		{ desc = ax.format_keymap_desc("Open the dashboard", true, "Dashboard")}
	);
	table.insert(ax.keymap_categories, ax.format_keymap_desc("Dashboard", true));






	-- Harpoon
	local harpoon = require("harpoon");
	nmap(
		"<C-h>",
		function() harpoon.ui:toggle_quick_menu(harpoon:list()) end,
		{ desc = ax.format_keymap_desc("Open harpoon list", true, "Harpoon")}
	);
	nmap(
		"<leader>ha",
		function() harpoon:list():append() end,
		{ desc = ax.format_keymap_desc("Append file to harpoon list", true, "Harpoon") }
	);
	nmap(
		"<leader>hn",
		function() harpoon:list():next() end,
		{ desc = ax.format_keymap_desc("Goto next file in harpoon list", true,
										"Harpoon") }
	);
	nmap(
		"<leader>hp",
		function() harpoon:list():prev() end,
		{ desc = ax.format_keymap_desc("Goto previous file in harpoon list", true,
										"Harpoon") }
	);
	nmap(
		"<leader>h1",
		function() harpoon:list():select(1) end,
		{ desc = ax.format_keymap_desc("Goto to 1st file in harpoon list", true,
										"Harpoon") }
	);
	nmap(
		"<leader>h2",
		function() harpoon:list():select(2) end,
		{ desc = ax.format_keymap_desc("Goto to 2nd file in harpoon list", true,
										"Harpoon") }
	);
	nmap(
		"<leader>h3",
		function() harpoon:list():select(3) end,
		{ desc = ax.format_keymap_desc("Goto to 3rd file in harpoon list", true,
										"Harpoon") }
	);
	nmap(
		"<leader>h4",
		function() harpoon:list():select(4) end,
		{ desc = ax.format_keymap_desc("Goto to 4th file in harpoon list", true,
										"Harpoon") }
	);
	nmap(
		"<leader>h5",
		function() harpoon:list():select(5) end,
		{ desc = ax.format_keymap_desc("Goto to 5th file in harpoon list", true,
										"Harpoon") }
	);
	table.insert(ax.keymap_categories, ax.format_keymap_desc("Harpoon", true));






	-- Telescope
	local telescope = require("telescope.builtin");
	nmap(
		"<leader>ff",
		function() telescope.find_files() end,
		{ desc = ax.format_keymap_desc("Fuzzy find project files", true, "Telescope") }
	);
	nmap(
		"<leader>fr",
		function() telescope.old_files() end,
		{ desc = ax.format_keymap_desc("Fuzzy find recent files", true, "Telescope") }
	);
	nmap(
		"<leader>fw",
		function() telescope.grep_string({ search = vim.fn.expand("<cword>") }) end,
		{ desc = ax.format_keymap_desc("Search for the word under cursor", true,
										"Telescope") }
	);
	nmap(
		"<leader>fW",
		function() telescope.grep_string({ search = vim.fn.expand("<cWORD>") }) end,
		{ desc = ax.format_keymap_desc("Search for section under cursor bounded by space",
										true, "Telescope") }
	);
	nmap(
		"<leader>fs",
		function()
			vim.ui.input({ prompt = "Enter word to search: " },
			function(input)
				if not (input == nil) then
					telescope.grep_string({ search = input })
				end
			end)
		end,
		{ desc = ax.format_keymap_desc("Search for input word", true, "Telescope") }
	);
	nmap(
		"<leader>fn",
		"<cmd> GetCurrentFunctions<CR>",
		{ desc = ax.format_keymap_desc("List all functions in the file", true,
										"Telescope") }
	);
	nmap(
		"<leader>fk",
		function() ax.list_keymaps() end,
		{ desc = ax.format_keymap_desc("List custom keymaps", true, "Telescope") }
	);
	table.insert(ax.keymap_categories, ax.format_keymap_desc("Telescope", true));






	-- Undotree
	nmap(
		"<leader>u",
		function()
			vim.cmd("UndotreeToggle");
			if not is_undotree_open then vim.cmd("UndotreeFocus") end
			is_undotree_open = not is_undotree_open;
		end,
		{ desc = ax.format_keymap_desc("Toggle undotree", true, "Undotree") }
	);
	table.insert(ax.keymap_categories, ax.format_keymap_desc("Undotree", true));






	-- Mini move
	local minimove = require("mini.move");
	nmap(
		"<M-h>",
		function() minimove.move_line("left") end,
		{ desc = ax.format_keymap_desc("Move current line leftwards", true, "Mini Move") }
	);
	nmap(
		"<M-j>",
		function() minimove.move_line("down") end,
		{ desc = ax.format_keymap_desc("Move current line downwards", true, "Mini Move") }
	);
	nmap(
		"<M-k>",
		function() minimove.move_line("up") end,
		{ desc = ax.format_keymap_desc("Move current line upwards", true, "Mini Move") }
	);
	nmap(
		"<M-l>",
		function() minimove.move_line("right") end,
		{ desc = ax.format_keymap_desc("Move current line rightwards", true,
										"Mini Move") }
	);
	map(
		"x",
		"<M-h>",
		function() minimove.move_selection("left") end,
		{ desc = ax.format_keymap_desc("Move selection leftwards", true, "Mini Move") }
	);
	map(
		"x",
		"<M-j>",
		function() minimove.move_selection("down") end,
		{ desc = ax.format_keymap_desc("Move selection downwards", true, "Mini Move") }
	);
	map(
		"x",
		"<M-k>",
		function() minimove.move_selection("up") end,
		{ desc = ax.format_keymap_desc("Move selection upwards", true, "Mini Move") }
	);
	map(
		"x",
		"<M-l>",
		function() minimove.move_selection("right") end,
		{ desc = ax.format_keymap_desc("Move selection rightwards", true, "Mini Move") }
	);
	table.insert(ax.keymap_categories, ax.format_keymap_desc("Mini Move", true));






	-- Comments
	local comments = require("Comment.api");
	nmap(
		"<C-c><C-c>",
		comments.toggle.linewise.current,
		{ desc = ax.format_keymap_desc("Toggles current line to/from single line comment",
										true, "Comment") }
	);
	map(
		"x",
		"<C-c>",
		function()
			ax.feedkeys("<ESC>", "nx");
			comments.toggle.linewise(vim.fn.visualmode());
		end,
		{ desc = ax.format_keymap_desc(
				"Toggles current selection to/from single line comments",
				true,
				"Comment"
			)
		}
	);
	table.insert(ax.keymap_categories, ax.format_keymap_desc("Comment", true));






	-- Multiple Cursors
	nmap(
		"<C-j>",
		"<cmd> MultipleCursorsAddDown<CR>",
		{ desc = ax.format_keymap_desc("Add another cursor down", true,
										"Multiple Cursors") }
	);
	nmap(
		"<C-k>",
		"<cmd> MultipleCursorsAddUp<CR>",
		{ desc = ax.format_keymap_desc("Add another cursor up", true,
										"Multiple Cursors") }
	);
	table.insert(ax.keymap_categories, ax.format_keymap_desc("Multiple Cursors", true));






	-- Color Picker
	nmap(
		"<C-p>",
		"<cmd> PickColor<CR>",
		{ desc = ax.format_keymap_desc("Open color picker", true, "Color Picker") }
	);
	map(
		"x",
		"<C-p>",
		"<cmd> PickColorInsert<CR>",
		{ desc = ax.format_keymap_desc("Open color picker", true, "Color Picker") }
	);
	table.insert(ax.keymap_categories, ax.format_keymap_desc("Color Picker", true));






	-- Vimwiki
	nmap(
		"<leader>ww",
		"<cmd>VimwikiIndex<CR>",
		{ desc = ax.format_keymap_desc("Open wiki index", true, "Vimwiki") }
	);
	nmap(
		"<leader>ws",
		"<cmd>VimwikiUISelect<CR>",
		{ desc = ax.format_keymap_desc("List all available wikis", true, "Vimwiki") }
	);
	nmap(
		"<leader>wn",
		"<cmd>VimwikiGoto<CR>",
		{ desc = ax.format_keymap_desc("Goto or create new wiki page", true, "Vimwiki") }
	);
	nmap(
		"<leader>wd",
		"<cmd>VimwikiDeleteFile<CR>",
		{ desc = ax.format_keymap_desc("Delete current wiki page", true, "Vimwiki") }
	);
	nmap(
		"<leader>wr",
		"<cmd>VimwikiRenameFile<CR>",
		{ desc = ax.format_keymap_desc("Rename current wiki page", true, "Vimwiki") }
	);
	nmap(
		"<leader>wt",
		function()
			local line = vim.fn.getline('.')

			if vim.startswith(line, "- [ ]") then
				vim.cmd("s/- \\[ \\]/- [x]");
				ax.clear_highlights();
			elseif vim.startswith(line, "- [x]") then
				vim.cmd("s/- \\[x\\]/- [ ]");
				ax.clear_highlights();
			end
		end,
		{ desc = ax.format_keymap_desc("Check todo list element", true, "Vimwiki") }
	);
	table.insert(ax.keymap_categories, ax.format_keymap_desc("Vimwiki", true));






	-- LSP, Trouble and JDTLS
	local jdtls = require("jdtls");
	vim.api.nvim_create_autocmd("LspAttach", {
		group = ax.augroup_name,
		callback = function(ev)
			-- Trouble
			nmap(
				"T",
				"<cmd>TroubleToggle<CR>",
				{
					buffer = ev.buf,
					desc = ax.format_keymap_desc("Open trouble diagnostics", true,
												"Trouble")
				}
			);
			nmap(
				"<leader>td",
				"<cmd>Trouble document_diagnostics<CR>",
				{
					buffer = ev.buf,
					desc = ax.format_keymap_desc("Open document diagnostics", true,
												"Trouble")
				}
			);
			nmap(
				"<leader>tw",
				"<cmd>Trouble workspace_diagnostics<CR>",
				{
					buffer = ev.buf,
					desc = ax.format_keymap_desc("Open workspace diagnostics", true,
												"Trouble")
				}
			);
			nmap(
				"<leader>tq",
				"<cmd>Trouble quickfix<CR>",
				{
					buffer = ev.buf,
					desc = ax.format_keymap_desc("Open quickfix list", true, "Trouble")
				}
			);
			nmap(
				"<leader>tl",
				"<cmd>Trouble loclist<CR>",
				{
					buffer = ev.buf,
					desc = ax.format_keymap_desc("Open location list", true, "Trouble")
				}
			);
			nmap(
				"gd",
				"<cmd>Trouble lsp_definitions<CR>",
				{
					buffer = ev.buf,
					desc = ax.format_keymap_desc("Goto definition", true, "Trouble")
				}
			);

			-- General LSP
			nmap(
				"K",
				vim.lsp.buf.hover,
				{
					buffer = ev.buf,
					desc = ax.format_keymap_desc("Display hover information", true,
												"L.S.P.")
				}
			);
			nmap(
				"<leader>k",
				vim.lsp.buf.signature_help,
				{
					buffer = ev.buf,
					desc = ax.format_keymap_desc("Show signature information", true,
												"L.S.P.")
				}
			);
			nmap(
				"gD",
				vim.lsp.buf.declaration,
				{
					buffer = ev.buf,
					desc = ax.format_keymap_desc("Goto declaration", true, "L.S.P.")
				}
			);
			nmap(
				"gt",
				"<cmd>Trouble lsp_type_definitions<CR>",
				{
					buffer = ev.buf,
					desc = ax.format_keymap_desc("Goto type definition", true, "L.S.P.")
				}
			);
			nmap(
				"gi",
				vim.lsp.buf.implementation,
				{
					buffer = ev.buf,
					desc = ax.format_keymap_desc("Goto implementation", true, "L.S.P.")
				}
			);
			nmap(
				"gr",
				"<cmd>Telescope lsp_references<CR>",
				{
					buffer = ev.buf,
					desc = ax.format_keymap_desc("List references in telescope UI",
												true, "L.S.P.")
				}
			);
			nmap(
				"]d",
				vim.diagnostic.goto_next,
				{
					buffer = ev.buf,
					desc = ax.format_keymap_desc("Goto next diagnostic", true, "L.S.P.")
				}
			);
			nmap(
				"[d",
				vim.diagnostic.goto_prev,
				{
					buffer = ev.buf,
					desc = ax.format_keymap_desc("Goto previous diagnostic", true,
												"L.S.P.")
				}
			);
			nmap(
				"<leader>ca",
				vim.lsp.buf.code_action,
				{
					buffer = ev.buf,
					desc = ax.format_keymap_desc("List code actions", true, "L.S.P.")
				}
			);
			nmap(
				"<F2>",
				vim.lsp.buf.rename,
				{
					buffer = ev.buf,
					desc = ax.format_keymap_desc("Rename symbol under cursor", true,
												"L.S.P.")
				}
			);
			nmap(
				"<leader>rn",
				vim.lsp.buf.rename,
				{
					buffer = ev.buf,
					desc = ax.format_keymap_desc("Rename symbol under cursor", true,
												"L.S.P.")
				}
			);
			nmap(
				"<leader>F",
				function() vim.lsp.buf.format({ async = true }) end,
				{
					buffer = ev.buf,
					desc = ax.format_keymap_desc("Format file", true, "L.S.P.")
				}
			);

			-- JDTLS Specific
			nmap(
				"<leader>jo",
				function() jdtls.organize_imports() end,
				{
					buffer = ev.buf,
					desc = ax.format_keymap_desc("Organise Imports", true, "J.D.T.L.S.")
				}
			);
			nmap(
				"<leader>jev",
				function() jdtls.extract_variable() end,
				{
					buffer = ev.buf,
					desc = ax.format_keymap_desc("Extract variable", true, "J.D.T.L.S.")
				}
			);
			nmap(
				"<leader>jec",
				function() jdtls.extract_constant() end,
				{
					buffer = ev.buf,
					desc = ax.format_keymap_desc("Extract constant", true, "J.D.T.L.S.")
				}
			);
			nmap(
				"<leader>jem",
				function() jdtls.extract_method({ true }) end,
				{
					buffer = ev.buf,
					desc = ax.format_keymap_desc("Extract method", true, "J.D.T.L.S.")
				}
			);
		end
	});
	table.insert(ax.keymap_categories, ax.format_keymap_desc("Trouble", true));
	table.insert(ax.keymap_categories, ax.format_keymap_desc("L.S.P.", true));
	table.insert(ax.keymap_categories, ax.format_keymap_desc("J.D.T.L.S.", true));






-- Completion
	local cmp = require("cmp");
	local luasnip = require("luasnip");
	map(
		{ "i", "s" },
		"<C-n>",
		cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item({ behavior = cmp.SelectBehavior.Select });
			elseif luasnip.expand_or_locally_jumpable() then
				luasnip.expand_or_jump()
			elseif ax.has_words_before() then
				cmp.complete()
				if #cmp.get_entries() == 1 then
					cmp.confirm({ select = true });
				end
			elseif not fallback == nil then
				fallback()
			end
		end).i,
		{ desc = ax.format_keymap_desc("Goto next suggestion in completion list", true,
										"Completion") }
	);
	map(
		{ "i", "s" },
		"<C-p>",
		cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item();
			elseif luasnip.locally_jumpable(-1) then
				luasnip.jump(-1)
			elseif not fallback == nil then
				fallback()
			end
		end).i,
		{ desc = ax.format_keymap_desc("Goto previous suggestion in completion list",
										true, "Completion") }
	);
	map(
		{ "i", "s" },
		"<C-u>",
		function() cmp.mapping.scroll_docs(-3); end,
		{ desc = ax.format_keymap_desc("Half scroll upwards in documentation popup", true,
										"Completion") }
	);
	map(
		{ "i", "s" },
		"<C-d>",
		function() cmp.mapping.scroll_docs(3); end,
		{ desc = ax.format_keymap_desc("Half scroll downwards in documentation popup",
										true, "Completion") }
	);
	map(
		{ "i", "s" },
		"<C-b>",
		function() cmp.mapping.scroll_docs(-6); end,
		{ desc = ax.format_keymap_desc("Full scroll upwards in documentation popup", true,
										"Completion") }
	);
	map(
		{ "i", "s" },
		"<C-f>",
		function() cmp.mapping.scroll_docs(6); end,
		{ desc = ax.format_keymap_desc("Full scroll downwards in documentation popup",
										true, "Completion") }
	);
	map(
		"i",
		"<C-s>",
		cmp.mapping(function(fallback)
			if cmp.visible() and cmp.get_active_entry() then
				cmp.confirm({ select = false });
			elseif not fallback == nil then
				fallback()
			end
		end).i,
		{ desc = ax.format_keymap_desc("Choose the completion suggestion (insert mode)",
										true, "Completion") }
	);
	map(
		"s",
		"<C-s>",
		function() cmp.mapping.confirm({ select = true }); end,
		{ desc = ax.format_keymap_desc(
				"Choose the completion suggestion (substitute mode)", true, "Completion"
		)}
	);
	map(
		{ "i", "s" },
		"<C-x>",
		function() cmp.mapping.abort(); end,
		{ desc = ax.format_keymap_desc("Abort completion", true, "Completion") }
	);
	table.insert(ax.keymap_categories, ax.format_keymap_desc("Completion", true));
end

vim.api.nvim_create_autocmd("VimEnter", {
	callback = set_mappings,
	group = ax.augroup_name
});
