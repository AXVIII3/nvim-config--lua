-- Global function to map key in given mode
_G.map = function(mode, key, action, opt)
	vim.keymap.set(mode, key, action, opt);
end

-- Global function to map keys in normal mode
_G.nmap = function(key, action, opt)
	vim.keymap.set("n", key, action, opt);
end

-- Global list where plugins or keymap categories can list their names which help in
-- keymap searching
_G.ax.keymap_categories = {};

-- Function which simulates the keypresses provided as parameter
_G.ax.feedkeys = function(keys, mode)
	vim.api.nvim_feedkeys(
		vim.api.nvim_replace_termcodes(keys, true, true, true),
		mode,
		false
	);
end

-- Function to clear highlights from searching, substitution, etc
-- Not using :nohl as it disables highlights for future searches
_G.ax.clear_highlights = function()
	ax.feedkeys("<ESC>:silent! /cLeAr_hIgHlIgHtS<CR>", "n");
end

-- Function to format the keymap description with a category flag and plugin/category name
-- Useful for fuzzy finding keymaps by category or plugin
_G.ax.format_keymap_desc = function(desc, is_plugin, name)
	local number_of_spaces = (name == nil and 154 or 104) - #desc - (name == nil and 0 or
							#name) - (is_plugin and 16 or 17);
	local postfix = (name == nil and "" or " [[" .. name .. "]]") ..
					(is_plugin and " [[Plugin]]" or " [[General]]");

	return desc .. (" "):rep(number_of_spaces) .. postfix;
end

-- Utility function to search for keymaps incase I forgor☠️
_G.ax.list_keymaps = function()
	local choices = {
		"All keymaps", "All custom general keymaps", "All custom plugin keymaps"
	};
	for _, value in ipairs(ax.keymap_categories) do
		table.insert(choices, value);
	end

	vim.ui.select(
		choices,
		{ prompt = "Which kind of keymaps do you want to see?" },
		function(ch)
			if ch == "All keymaps" then
				ax.feedkeys(":Telescope keymaps<CR>", "n");
			elseif ch == "All custom general keymaps" then
				ax.feedkeys(":Telescope keymaps<CR>     [[General]]<ESC>I", "n");
			elseif ch == "All custom plugin keymaps" then
				ax.feedkeys(":Telescope keymaps<CR>     [[Plugin]]<ESC>I", "n");
			elseif not (ch == nil) then
				ax.feedkeys(":Telescope keymaps<CR>     [[" ..
				ch:gsub("(%S+)%s*(%[%[)(.-)(%]%])$", "%1]] [[%3") ..
				"]]<ESC>I", "n");
			end
		end
	);
end

_G.ax.has_words_before = function()
	unpack = unpack or table.unpack;
	local line, col = unpack(vim.api.nvim_win_get_cursor(0));
	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]
								:sub(col, col):match("%s") == nil
end

_G.ax.change_indent_style = function()
	vim.ui.select(
		{ "Tabs", "Spaces" },
		{ prompt = "What kind of indenting do you want?" },
		function(ch)
			if not (ch == nil) then
				vim.opt.expandtab = (ch == "Spaces");

				local old_indent_width = vim.api.nvim_get_option("shiftwidth") or
										vim.api.nvim_get_option("softtabstop") or
										vim.api.nvim_get_option("tabstop") or 4
				old_indent_width = math.floor(old_indent_width);

				vim.ui.input(
					{ prompt = "Tab/Space width: " },
					function(input)
						if not (input == nil) then
							input = tonumber(input);
							vim.opt.tabstop = input;                                       -- Number of spaces a tab counts for
							vim.opt.shiftwidth = input;                                    -- IDK what this is for sure but similar to tabstop
							vim.opt.softtabstop = input;                                   -- Number of spaces a tab coutns for while performing editing operations

						end
						ax.feedkeys(":retab<CR>", "n");
						if ch == "Tabs" then
							ax.feedkeys(":%s/\\(^\\s*\\)\\@<=" ..
							(" "):rep(old_indent_width) .. "/\t/g<CR>", "n");
							ax.clear_highlights();
						end
					end
				);

			end
		end
	);
end

local is_column_visible = ax.should_column_be_visible_by_default;                          -- Line wrap column visible by default or not
_G.ax.toggle_color_column = function()
	if not is_column_visible then
		vim.ui.input(
			{ prompt = "Enter column position: " },
			function(input)
				if not (input == nil) then
					vim.opt.colorcolumn = input                                            -- A vertical line at a column width to help in keeping text length on check
					is_column_visible = true;
				end
			end
		);
	else
		vim.opt.colorcolumn = "0";                                                         -- Turn off vertical line
		is_column_visible = false;
	end
end
