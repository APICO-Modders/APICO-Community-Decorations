function define_cloth_tables()
    CONST_DESIGN_TABLE = {
        "Bee",
        "Check",
        "Diamond",
        "Dotted",
        "Plain",
        "Polka"
    }
    
    for i=1,#CONST_COLOR_TABLE do
        lowercase_color_name = string.lower(CONST_COLOR_TABLE[i])

        for j=1,#CONST_DESIGN_TABLE do
            lowercase_design_name = string.lower(CONST_DESIGN_TABLE[j])
            api_define_object({
                id = lowercase_color_name .. "_" .. lowercase_design_name .. "_table",
                name = CONST_COLOR_TABLE[i] .. " Table (" .. CONST_DESIGN_TABLE[j] .. ")",
                category = "Furniture",
                tooltip = "A simple table with a " .. lowercase_color_name .. lowercase_design_name .. " tablecloth.",
                shop_key = false,
                shop_buy = 0,
                shop_sell = 0,
                tools = {"hammer1"},
                has_shadow = true
            }, "sprites/tables/" .. lowercase_design_name .. "/" .. lowercase_color_name .. lowercase_design_name .. "table.png")    
        end
    end
end