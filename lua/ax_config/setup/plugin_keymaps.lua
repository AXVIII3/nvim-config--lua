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
		function() telescope.oldfiles() end,
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






	-- Trouble and JDTLS
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
	table.insert(ax.keymap_categories, ax.format_keymap_desc("J.D.T.L.S.", true));






-- -- Completion
	local cmp = require("cmp");
	local luasnip = require("luasnip");
	map(
		{ "i", "s" },
		"<Tab>",
		function()
			if cmp.visible() then
				cmp.select_next_item({ behavior = cmp.SelectBehavior.Select });
			elseif luasnip.expand_or_locally_jumpable() then
				luasnip.expand_or_jump()
			elseif ax.has_words_before() then
				cmp.complete()
			else
				ax.feedkeys("<Tab>", "ni");
			end
		end,
		{ desc = ax.format_keymap_desc("Select next suggestion", true, "C.M.P.") }
	);
	map(
		{ "i", "s" },
		"<S-Tab>",
		function()
			if cmp.visible() then
				cmp.select_prev_item();
			elseif luasnip.locally_jumpable(-1) then
				luasnip.jump(-1)
			else
				ax.feedkeys("<S-Tab>", "ni");
			end
		end,
		{ desc = ax.format_keymap_desc("Select previous suggestion", true, "C.M.P.") }
	);
	map(
		{ "i", "s" },
		"<CR>",
		function()
			if not cmp.confirm({ select = false }) then
				ax.feedkeys("<CR>", "ni");
			end
		end,
		{ desc = ax.format_keymap_desc("Enter suffestion", true, "C.M.P.") }
	);
	map(
		"i",
		"<C-u>",
		cmp.mapping.scroll_docs(-3),
		{ desc = ax.format_keymap_desc("Half scroll docs up", true, "C.M.P.") }
	);
	map(
		"i",
		"<C-d>",
		cmp.mapping.scroll_docs(3),
		{ desc = ax.format_keymap_desc("Half scroll docs down", true, "C.M.P.") }
	);
	map(
		"i",
		"<C-b>",
		cmp.mapping.scroll_docs(-6),
		{ desc = ax.format_keymap_desc("Full scroll docs up", true, "C.M.P.") }
	);
	map(
		"i",
		"<C-u>",
		cmp.mapping.scroll_docs(6),
		{ desc = ax.format_keymap_desc("Full scroll docs down", true, "C.M.P.") }
	);
	table.insert(ax.keymap_categories, ax.format_keymap_desc("C.M.P.", true));






	-- DAP and debugging
	local dap = require("dap");
	dap.listeners.before.attach[ax.augroup_name] = function()
		print("Yay Dap Works!")
		nmap(
			"<F3>",
			function() dap.toggle_breakpoint() end,
			{
				buffer = 0,
				desc = ax.format_keymap_desc("Toggle breakpoint", true, "D.A.P.")
			}
		);
		nmap(
			"<F4>",
			function() dap.set_breakpoint(vim.fn.input("Condition: ")) end,
			{
				buffer = 0,
				desc = ax.format_keymap_desc("Set conditional breakpoint", true, "D.A.P.")
			}
		);
		nmap(
			"<F5>",
			function() dap.set_breakpoint(nil, nil, vim.fn.input("Message: ")) end,
			{
				buffer = 0,
				desc = ax.format_keymap_desc("Set log-point", true, "D.A.P.")
			}
		);
		nmap(
			"<F6>",
			function() dap.continue() end,
			{
				buffer = 0,
				desc = ax.format_keymap_desc("Continue progression", true, "D.A.P.")
			}
		);
		nmap(
			"<F7>",
			function() dap.step_over() end,
			{
				buffer = 0,
				desc = ax.format_keymap_desc("Step over", true, "D.A.P.")
			}
		);
		nmap(
			"<F8>",
			function() dap.step_into() end,
			{
				buffer = 0,
				desc = ax.format_keymap_desc("Step into", true, "D.A.P.")
			}
		);
		nmap(
			"<F9>",
			function() dap.step_out() end,
			{
				buffer = 0,
				desc = ax.format_keymap_desc("Step out", true, "D.A.P.")
			}
		);
		nmap(
			"<F10>",
			function() dap.repl.open() end,
			{
				buffer = 0,
				desc = ax.format_keymap_desc("Open Repl", true, "D.A.P.")
			}
		);
	end
	dap.listeners.before.attach.dapui_config = function()
		nmap(
			"<leader>du",
			function() require("dapui").toggle() end,
			{
				buffer = 0,
				desc = ax.format_keymap_desc("Open DAP UI", true, "D.A.P. U.I.")
			}
		);
	end
	table.insert(ax.keymap_categories, ax.format_keymap_desc("D.A.P.", true));
	table.insert(ax.keymap_categories, ax.format_keymap_desc("D.A.P. U.I.", true));
end

vim.api.nvim_create_autocmd("VimEnter", {
	callback = set_mappings,
	group = ax.augroup_name
});
