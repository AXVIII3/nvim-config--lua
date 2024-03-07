----------------------------------------------------------------- NOTE: ----------------------------------------------------------------
-- These are settings which may vary device to device or I just want to keep together in case I want to change them
-- Step 1: Set the variable below to your liking
-- Step 2: Rename this file from _settings.lua to settings.lua
-- Enjoy
----------------------------------------------------------------------------------------------------------------------------------------

--------------------------------------------------------------- SET THESE --------------------------------------------------------------
return {
    leader = STRING CHARACTER,                                    -- The character which is to be used as the neovim leader key
    augroupname = SINGULAR STRING,                                -- The autocmd group to use while defining custom auto commands
    transparent = BOOLEAN,                                        -- If the buffer background is transparent or coloured
    columnwidth = STTRING NUMBER,                                 -- The width at which to draw the column line
    isColumnVisibleDefault = BOOLEAN,                             -- If the line width column should be on by default
    undofilesdir = STRING PATH,                                   -- Custom variable which store the directory to store undofile in
    wikidir = STRING PATH,                                        -- Where all my norg wiki notes are stored
    isPandocAvailable = BOOLEAN,                                  -- If Pandoc is available on the device
    pandocMdToPdfCommand = STRING,                                -- The pandoc command to convert markdown to pdf
}
----------------------------------------------------------------------------------------------------------------------------------------
