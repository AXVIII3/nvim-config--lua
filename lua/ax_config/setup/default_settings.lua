return {
	-- Preference Specific (harmless)
	leader = " ",                                                                          -- The neovim keymaps leader key
	augroup_name = "ax-augroup",                                                           -- Name for the custom auto groups
	column_width = "0",                                                                    -- The column number where the line limit column should be drawn
	should_column_be_visible_by_default = false,                                           -- If the column line should be visible by default or not
	should_background_be_transparent = true,                                               -- If the terminal background should be transparent or not when entering neovim
	undo_files_directory = vim.fn.stdpath("data") .. "undofiles",                          -- The directory where the undo tree persistent files should be stored
	dashboard_ascii_art = string.rep("\n", 8) .. [[
    ██████╗  █████╗ ███████╗██╗  ██╗██████╗  ██████╗  █████╗ ██████╗ ██████╗ 
    ██╔══██╗██╔══██╗██╔════╝██║  ██║██╔══██╗██╔═══██╗██╔══██╗██╔══██╗██╔══██╗
    ██║  ██║███████║███████╗███████║██████╔╝██║   ██║███████║██████╔╝██║  ██║
    ██║  ██║██╔══██║╚════██║██╔══██║██╔══██╗██║   ██║██╔══██║██╔══██╗██║  ██║
    ██████╔╝██║  ██║███████║██║  ██║██████╔╝╚██████╔╝██║  ██║██║  ██║██████╔╝
    ╚═════╝ ╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝╚═════╝  ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝╚═════╝ 
                                                                  SMILE :)   
    ]] .. "\n\n\n",                                                                        -- Fun art to show on the dash
}
