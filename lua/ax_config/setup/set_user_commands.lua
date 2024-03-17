-- User command for clearing highlights
vim.api.nvim_create_user_command(
	"ClearHighlights",
	function() ax.clear_highlights() end,
	{}
);

-- User command for keymap search
vim.api.nvim_create_user_command(
	"KeymapSearch",
	function() ax.list_keymaps() end,
	{}
);

-- User command for color column toggle
vim.api.nvim_create_user_command(
	"ChangeIndentStyle",
	function() ax.change_indent_style() end,
	{}
);

-- User commanf to toggle color column
vim.api.nvim_create_user_command(
	"ToggleColorColumn",
	function() ax.toggle_color_column() end,
	{}
);

if ax.should_setup_java then
	-- User commanf to compile the current JAVA file and run it
	vim.api.nvim_create_user_command(
		"JavaCompileAndRunCurrentFile",
		function()
			local dir_path = vim.fn.expand("%:p:h");
			local file_name = vim.fn.expand("%:t");
			local class_name = vim.fn.expand("%:t:r");
			vim.cmd("terminal");
			ax.feedkeys("iclear<CR> cd \"" .. dir_path .. "\"; javac \""  .. file_name ..
						"\" -d \"" .. dir_path .."\\out\"; cd \"" .. dir_path ..
						"\\out\"; java " .. class_name .. "<CR>", "n");
		end,
		{}
	);
end
