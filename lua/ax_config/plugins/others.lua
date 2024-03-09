-- Plugins with more niche or unique functions than normal neovim usage

return {
	-- Easier navigation through my notes wiki
	{
		"vimwiki/vimwiki",
		name = "vimwiki",
		init = function()
			if ax.should_setup_vimwiki then
				vim.g.vimwiki_list = {
					{
						path = ax.vimwiki_directory,
						syntax = "markdown",
						ext = ".md"
					}
				};

				vim.g.vimwiki_ext2syntax = {
					[".md"] = "markdown",
					[".markdown"] = "markdown",
					[".mdown"] = "markdown"
				}

				vim.g.vimwiki_global_ext = 0;
				vim.g.vimwiki_hl_headers = 1;
				vim.g.vimwiki_markdown_link_ext = 1;
				vim.g.taskwiki_markdown_syntax = "markdown";
			end
		end
	},

	-- To preview markdown files while editing in realtime
	{
		"iamcco/markdown-preview.nvim",
		name = "markdown_preview",
		build = function() vim.fn["mkdp#util#install"]() end,
		init = function()
			vim.g.mkdp_filetypes = { "markdown" }
		end
	},

	-- Hides important variables like secrets and tokens
	{
		"laytan/cloak.nvim",
		name = "cloak",
		config = function()
			require("cloak").setup({
				cloak_character = "⬤",
				patterns = {
					{
						file_pattern = {
							".env",
							"*.env"
						},
						cloak_pattern = { "=.+" },
						replace = nil
					}
				}
			});
		end
	}
}
