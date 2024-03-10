-- User command for keymap search
vim.api.nvim_create_user_command(
	"KeymapSearch",
	function() ax.list_keymaps() end,
	{}
);
