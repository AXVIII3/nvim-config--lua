-- Plugins that are essential to my workflow

return {
	-- Useful neovim functions used by many plugins
	{
		"nvim-lua/plenary.nvim",
		name = "plenary",
		lazy = true
	},


	-- Quick file switching
	{
		"ThePrimeagen/Harpoon",
		name = "harpoon",
		branch = "harpoon2",                                                               -- New harpoon version (remade)
		dependencies = "plenary",
		config = function()
			---@diagnostic disable-next-line: missing-fields, missing-parameter
			require("harpoon").setup({ settings = { save_on_toggle = true } });
		end
	},


	-- Fuzzy finding and Listing
	{
		"nvim-telescope/telescope.nvim",
		name = "telescope",
		tag = "0.1.5",                                                                     -- Latest tag as of 09.03.24 (no setting this can break stuff)
		dependencies = "plenary",
		---@diagnostic disable-next-line: missing-parameter
		config = function() require("telescope").setup(); end
	},


	-- Better parser and syntax tree
	{
		"nvim-treesitter/nvim-treesitter",
		name = "treesitter",
		init = function(plugin)
		  -- From https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/plugins/treesitter.lua
		  --
		  -- Add nvim-treesitter queries to the rtp and it's custom query predicates early
		  -- This is needed because a bunch of plugins no longer `require("nvim-treesitter")`,
		  -- which no longer trigger the nvim-treesitter module to be loaded in time.
		  -- Luckily, the only things that those plugins need are the custom queries,
		  -- which we make available during startup.
			require("lazy.core.loader").add_to_rtp(plugin);
			require("nvim-treesitter.query_predicates");
		end,
		build = ":TSUpdate",                                                               -- Auto update all parsers when TS is installed or updated
		event = { "BufReadPost", "BufWritePost", "BufNewFile" },
		cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
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
		dependencies = { "treesitter", "telescope" },
		event = { "BufReadPost", "BufWritePost", "BufNewFile" }
	}
}
