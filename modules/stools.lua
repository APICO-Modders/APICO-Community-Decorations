function define_stools()
    define_wood_stools()
    define_metal_stools()
end

function define_wood_stools()
    for i=1,#CONST_COLOR_TABLE do
        lowercase_color_name = string.lower(CONST_COLOR_TABLE[i])
        api_define_object({
            id = lowercase_color_name .. "_stool", 
            name = CONST_COLOR_TABLE[i] .. " Stool",
            category = "Decoration",
            tooltip = "A " .. lowercase_color_name .. " stool. Don't stand on it!",
            shop_buy = 0,
            shop_sell = 0,
            tools = {"hammer1"}
        }, "sprites/stools/colorstools/" .. lowercase_color_name .. "_stool.png")
    end
end

function define_metal_stools()
    for i=1,#CONST_COLOR_TABLE do
        lowercase_color_name = string.lower(CONST_COLOR_TABLE[i])
        api_define_object({
            id = lowercase_color_name .. "_metalstool", 
            name = CONST_COLOR_TABLE[i] .. " Metal Stool",
            category = "Decoration",
            tooltip = "A " .. lowercase_color_name .. " metal stool. Sturdier than a wood one!",
            shop_buy = 0,
            shop_sell = 0,
            tools = {"hammer1"}
        }, "sprites/stools/colormetalstools/" .. lowercase_color_name .. "_metalstool.png")
    end
end