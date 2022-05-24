function define_cloth_tables()
    for i=1,#CONST_COLOR_TABLE do
        lowercase_color_name = string.lower(CONST_COLOR_TABLE[i])

        api_define_object({
            id = lowercase_color_name .. "_checkered_table",
            name = CONST_COLOR_TABLE[i] .. " Table (Checkered)",
            category = "Furniture",
            tooltip = "A simple table with a " .. lowercase_color_name .. " checkered tablecloth.",
            shop_key = false,
            shop_buy = 0,
            shop_sell = 0,
            tools = {"hammer1"},
            has_shadow = true
        }, "sprites/tables/" .. lowercase_color_name .. "checktable.png")

        api_define_object({
            id = lowercase_color_name .. "_table",
            name = CONST_COLOR_TABLE[i] .. " Table",
            category = "Furniture",
            tooltip = "A simple table with a " .. lowercase_color_name .. " tablecloth.",
            shop_key = false,
            shop_buy = 0,
            shop_sell = 0,
            tools = {"hammer1"},
            has_shadow = true
        }, "sprites/tables/" .. lowercase_color_name .. "plaintable.png")
    end
end