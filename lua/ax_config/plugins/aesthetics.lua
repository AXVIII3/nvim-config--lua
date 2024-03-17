-- Plugins to enhance the look and feel of neovim

--------- THIS WHOLE SECTION SHOULD BE DELETED AFTER THE PLUGIN CREATOR FIXES IT ---------
-- Also delete the function call in the plugin config call
local function color_fix(n, fg, bg, style)
		local opts = {}
		opts['fg'] = fg ~= "none" and fg or nil
		opts['bg'] = bg ~= "none" and bg or nil

		if style then
			for _,v in ipairs(vim.split(style, ',')) do
				if v:lower() ~= 'none' then opts[v]=true end
			end
		end

		vim.api.nvim_set_hl(0, n, opts)
	end

local function temp_staline_color_fix()
	local config = require("staline.config");
    local mode = vim.api.nvim_get_mode()['mode'];

    local fg = config.mode_colors[mode];
    local bg = config.defaults.bg;

	color_fix('Staline', fg, bg, config.defaults.font_active);
	color_fix('StalineFill', config.defaults.fg, fg, config.defaults.font_active);
	color_fix('StalineNone', nil, bg);
	color_fix('DoubleSep', fg, config.defaults.inactive_color);
	color_fix('MidSep', config.defaults.inactive_color, bg);
end
----------------------------- END OF SECTION TO DELETE -----------------------------------

return {
	-- Main Color Scheme
	{
		"navarasu/onedark.nvim",
		name = "onedark",
		priority = 1000,                                                                   -- Highest priority in my config
		lazy = false,
		config = function()
			local onedark = require("onedark");

			onedark.setup({
				style = "cool",
				transparent = true,
				colors = { bg0 = "#1f2229" }
			});

			onedark.load();
		end
	},


	-- Good looking UI for vim.ui.input and vim.ui.select
	{
		"stevearc/dressing.nvim",
		name = "dressing",
		dependencies = "telescope",
		lazy = true,
		init = function()
			---@diagnostic disable-next-line: duplicate-set-field
			vim.ui.select = function(...)
				require("lazy").load({ plugins = { "dressing" } })
				return vim.ui.select(...)
			end
			---@diagnostic disable-next-line: duplicate-set-field
			vim.ui.input = function(...)
				require("lazy").load({ plugins = { "dressing" } })
				return vim.ui.input(...)
			end
		end,
		config = function()
			require("dressing").setup({
				select = { telescope = { initial_mode = "normal" } }
			});
		end
	},


	-- Status Line
	{
		"tamton-aquib/staline.nvim",
		name = "staline",
		config = function()
			require("staline").setup({
				sections = {
					left = { " ", "right_sep", "-mode", "left_sep", " ", },
					mid  = { "lsp" },
					right =  {
						"right_sep ", function()
							return { "StalineFill", vim.fn.expand("%:t") }
						end, " left_sep", " ",
						"right_sep", function()
							return {
								"StalineFill",
								---@diagnostic disable-next-line: undefined-field
								(vim.opt.expandtab._value and " Spaces" or " Tab" .. ": "
								.. vim.api.nvim_buf_get_option(0, "shiftwidth") .. " ")
							}
							end, "left_sep", " ",
						"right_sep", "-line_column", "left_sep", " "
					}
				},
				special_table = {
					netrw = { "", "" },
					help = { "Help", "󰗚  " },
					TelescopePrompt = { "Telescope", "  " },
					dashboard = { "Everything setup and ready to roll!", "" },
					undotree = { "Undotree", "↩  " },
					diff = { "Diff", "  " },
				},
				defaults = {
					fg = "#181a1f",
					left_separator = "",
					right_separator = "",
					true_colors = true,
					font_active = "bold",
					line_column = "L%l:C%c ~ %p%%"
				},
				mode_colors = {
					["n"] = "#98c379", ["c"] = "#61afef", ["i"] = "#d19a66",
					["v"] = "#c678dd", ["V"] = "#9a6dd1", [""] = "#8068de",
					["R"] = "#e55561", ['t'] = "#56b6c2",

					['ic'] = "#000000", ['s'] = "#000000", ['S'] = "#000000",
					['r'] = "#000000"
				},
				mode_icons = {
					["n"] = "Normal", ["i"] = "Insert", ["c"] = "Command",
					["v"] = "Visual", ["V"] = "Visual Line", [""] = "Visual Block",
					["R"] = "Replace", ["t"] = "Terminal",

					["no"] = "no", ["niI"] = "niI", ["niR"] = "niR", ["no"] = "no",
					["niV"] = "niV", ["nov"] = "nov", ["noV"] = "noV", ["ic"] = "ic",
					["ix"] = "ix", ["s"] = "s", ["S"] = "S", ["r"] = "r", ["r?"] = "r?",
					["!"] = "!",
				},
			});

			temp_staline_color_fix();
		end
	},


	-- Dashboard
	{
		"nvimdev/dashboard-nvim",
		name = "dashboard",
		event = "VimEnter",
		config = function()
			vim.api.nvim_set_hl(0, "DashboardHeader", { fg="#97ca72" });

			require("dashboard").setup({
				theme = "doom",
				hide = { statusline = false, },
				config = {
					header = vim.split(ax.dashboard_ascii_art, "\n"),
					center = {
						{
							action = "ene",
							desc = " New file" .. (" "):rep(31),
							icon = "📄",
							key = "n"
						},
						{
							action = "Ex",
							desc = " File Explorer" .. (" "):rep(26),
							icon = "📂",
							key = "e"
						},
						{
							action = "Telescope find_files",
							desc = " Open files" .. (" "):rep(29),
							icon = "🔍",
							key = "o"
						},
						{
							action = "Telescope oldfiles",
							desc = " Recent files" .. (" "):rep(27),
							icon = "⌛",
							key = "r"
						},
						{
							action = "KeymapSearch",
							desc = " Keymaps" .. (" "):rep(32),
							icon = "⌨️ ",
							key = "m"
						},
						{
							action = "lua vim.cmd(\"Ex \" .. vim.fn.stdpath(\"config\"))",
							desc = " Open Config" .. (" "):rep(28),
							icon = " ",
							key = "c"
						},
						{
							desc = " Lazy" .. (" "):rep(35),
							action = "Lazy",
							icon = "💤",
							key = "l"
						},
						{
							action = "qa",
							desc = " Quit" .. (" "):rep(35),
							icon = " ",
							key = "q"
						},
					},
					footer = {}
				},
			});
		end
	}
}
