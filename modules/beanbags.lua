function define_beanbags()
    for i=1,#CONST_COLOR_TABLE do
        lowercase_color_name = string.lower(CONST_COLOR_TABLE[i])
        api_define_object({
            id = lowercase_color_name .. "_beanbag", 
            name = CONST_COLOR_TABLE[i] .. " Beanbag",
            category = "Furniture",
            tooltip = "A " .. lowercase_color_name .. " beanbag. Perfect for sitting!",
            shop_buy = 0,
            shop_sell = 0,
            tools = {"hammer1"},
            depth = -8,
            bench = true
        }, "sprites/beanbags/" .. lowercase_color_name .. "_beanbag.png")
    end
end