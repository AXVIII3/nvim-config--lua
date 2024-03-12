-- Plugins that are essential to my workflow

return {
	-- Useful neovim functions used by many plugins
	{
		"nvim-lua/plenary.nvim",
		name = "plenary",
		priority = 900                                                                     -- 2nd Highest Priority in my config
	},


	-- Quick file switching
	{
		"ThePrimeagen/Harpoon",
		name = "harpoon",
		branch = "harpoon2",                                                               -- New harpoon version (remade)
		dependencies = "plenary",
		config = function()
			---@diagnostic disable-next-line: missing-fields, missing-parameter
			require("harpoon").setup({
				settings = {
					save_on_toggle = true
				}
			});
		end
	},


	-- Fuzzy finding and Listing
	{
		"nvim-telescope/telescope.nvim",
		name = "telescope",
		tag = "0.1.5",                                                                     -- Latest tag as of 09.03.24 (no setting this can break stuff)
		dependencies = "plenary",
		config = function()
			---@diagnostic disable-next-line: missing-parameter
			require("telescope").setup();
		end
	},


	-- Better parser and syntax tree
	{
		"nvim-treesitter/nvim-treesitter",
		name = "treesitter",
		build = ":TSUpdate",                                                               -- Auto update all parsers when TS is installed or updated
		config = function()
			require("nvim-treesitter.install").prefer_git = true;                          -- Sometimes things break, this fixes it sometimes by using git instead of curl
			---@diagnostic disable-next-line: missing-fields
			require("nvim-treesitter.configs").setup({
				sync_install = false,
				auto_install = true,
				highlight = {
					enable = true,
					additional_vim_regex_highlighting = false
				}
				-- TODO: Check out incremental selection
			});
		end
	},
	{
		"eckon/treesitter-current-functions",                                              -- Complementary plugin which lists out all functions in the buffer
		name = "current_functions",
		dependencies = { "treesitter", "telescope" }
	}
}
