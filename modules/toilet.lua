function define_toilet()
    api_define_menu_object({
        id = "toilet",
        name = "Toilet",
        category = "Decorations",
        tooltip = "Flush away your excess items!",
        shop_key = true,
        shop_buy = 0,
        shop_sell = 0,
        layout = {},
        buttons = {"Help", "Move", "Target", "Close"},
        info = {},
        tools = {"mouse1", "hammer1"},
        placeable = true
        }, "sprites/toilet/toilet.png", "sprites/toilet/toilet_gui.png", {})
end