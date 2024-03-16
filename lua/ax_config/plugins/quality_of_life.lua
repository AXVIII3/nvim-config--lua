-- Plugins to improve quality of life while vimming

return {
	-- Tree visualisation of undo history
	{
		"mbbill/undotree",
		name = "undotree",
		cmd = { "UndotreeToggle", "UndotreeFocus" }
	},


	-- Highlights for special comments
	{
		"folke/todo-comments.nvim",
		name = "todo_comments",
		dependencies = { "plenary" },
		event = { "BufReadPost", "BufWritePost", "BufNewFile" },
		config = function()
			require("todo-comments").setup();
		end
	},


	-- Move lines or selected sections up or down
	{
		"echasnovski/mini.move",
		name = "mini_move",
		config = function()
			require("mini.move").setup();
		end
	},


	-- Comment line or blocks of code
	{
		"numToStr/Comment.nvim",
		name = "comment",
		config = function()
			---@diagnostic disable-next-line: missing-fields
			require("Comment").setup({
				mappings = {
					basic = false,
					extra = false
				}
			});
		end
	},


	-- Add multiple cursors
	{
		"brenton-leighton/multiple-cursors.nvim",
		name = "multiple_cursors",
		config = function()
			require("multiple-cursors").setup();
		end
	},


	-- Color picker
	{
		"ziontee113/color-picker.nvim",
		name = "color_picker",
		config = function()
			require("color-picker").setup({
				["border"] = "solid",
				["background_highlight_group"] = "PMenu"
			});
		end
	}
}
