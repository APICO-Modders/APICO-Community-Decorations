function define_stools()
    define_wood_stools()
    define_metal_stools()
    dw_define_recipe({{"log", 10}, {"stone", 5}}, "community_decorations_white_stool", 1)
    dw_define_recipe({{"log", 5}, {"glue", 2}, {"stone", 10}}, "community_decorations_white_metalstool", 1)
end

function define_wood_stools()
    for i=1,#CONST_COLOR_TABLE do
        lowercase_color_name = string.lower(CONST_COLOR_TABLE[i])
        api_define_object({
            id = lowercase_color_name .. "_stool", 
            name = CONST_COLOR_TABLE[i] .. " Stool",
            category = "Furniture",
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
            category = "Furniture",
            tooltip = "A " .. lowercase_color_name .. " metal stool. Sturdier than a wood one!",
            shop_buy = 0,
            shop_sell = 0,
            tools = {"hammer1"}
        }, "sprites/stools/colormetalstools/" .. lowercase_color_name .. "_metalstool.png")
    end
end