_G.ax.keymap_categories = {};

_G.ax.feedkeys = function(keys, mode)
	vim.api.nvim_feedkeys(
		vim.api.nvim_replace_termcodes(keys, true, true, true),
		mode,
		false
	);
end

_G.ax.clear_highlights = function()
	ax.feedkeys("/cLeAr_hIgHlIgHtS<CR>", "n");
end

_G.ax.format_keymap_desc = function(desc, is_plugin, name)
	local number_of_spaces = (name == nil and 154 or 104) - #desc - (name == nil and 0 or
							#name) - (is_plugin and 16 or 17);
	local postfix = (name == nil and "" or " [[" .. name .. "]]") ..
					(is_plugin and " [[Plugin]]" or " [[General]]");

	return desc .. (" "):rep(number_of_spaces) .. postfix;
end

_G.ax.list_keymaps = function()
	local choices = {
		"All keymaps", "All custom general plugins", "All custom plugin keymaps"
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
	end)
end

_G.ax.has_words_before = function()
	unpack = unpack or table.unpack;
	local line, col = unpack(vim.api.nvim_win_get_cursor(0));
	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]
								:sub(col, col):match("%s") == nil
end
