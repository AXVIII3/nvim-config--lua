-- Plugins with more niche or unique functions than normal neovim usage

return {
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
