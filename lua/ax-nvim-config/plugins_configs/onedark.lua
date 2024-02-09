return function()
    local onedark = require("onedark");
    onedark.setup({
        ending_tildes = true,
        style = "cool",
        transparent = true,
        colors = { bg0 = "#1f2229" }
    });
    onedark.load();
end
