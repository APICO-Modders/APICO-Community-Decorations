function define_toilet()
    api_define_menu_object({
        id = "toilet",
        name = "Toilet",
        category = "Decorations",
        tooltip = "Flush away your excess items!",
        shop_key = true,
        shop_buy = 0,
        shop_sell = 0,
        layout = {
            {7, 17},
            {30, 17},
            {53, 17},
            {7, 40},
            {30, 40},
            {53, 40}
        },
        buttons = {"Help", "Move", "Target", "Close"},
        info = {},
        tools = {"mouse1", "hammer1"},
        placeable = true
        }, "sprites/toilet/toilet.png", "sprites/toilet/toilet_gui.png", {
            define = "define_flush_button",
            draw = "draw_toilet_gui"
        })
end

function define_flush_button(menu_id)
    --api_dp(menu_id, "flush_button_sprite", api_define_sprite("flush_button", "sprites/toilet/flush_button.png"))
    api_define_button(
        menu_id,
        "flush_button",
        5,
        60,
        "Flush!",
        "flush_toilet",
        "sprites/toilet/flush_button.png"
    )
end

function flush_toilet(menu_id)
    for i=1,6 do
        api_slot_clear(i)
    end
end

function draw_toilet_gui(menu_id)
    api_draw_button(api_gp(menu_id, "flush_button"))
end