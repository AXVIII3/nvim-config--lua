----------------------------------------------------------------- NOTE: ----------------------------------------------------------------
-- Step 1: Set the variable below to your liking
-- Step 2: Rename this file from _settings.lua to settings.lua
-- Enjoy
----------------------------------------------------------------------------------------------------------------------------------------

--------------------------------------------------------------- SET THESE --------------------------------------------------------------
return {
    leader = STRING CHARACTER,                                    -- The character which is to be used as the neovim leader key
    augroupname = SINGULAR STRING,                                -- The autocmd group to use while defining custom auto commands
    transparent = BOOLEAN,                                        -- If the buffer background is transparent or coloured
    spaceLength = NUMBER,                                         -- Custom variable which stores how many spaces I would like in a tab
    undofilesdir = STRING PATH,                                    -- Custom variable which store the directory to store undofile in
    ensure_installed_parsers = STRING TABLE                       -- All parsers to install for Treesitter
}
----------------------------------------------------------------------------------------------------------------------------------------
