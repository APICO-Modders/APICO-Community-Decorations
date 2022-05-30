JL_COLORS = {
    "Blue",
    "Green",
    "Orange",
    "Red",
    "Turquoise"
}

JL_SPRITES = {}

function define_jellyfish_lamps()
    for i=1,#JL_COLORS do
        lowercase_color_name = string.lower(JL_COLORS[i])
        iname = lowercase_color_name .. "_jellyfish_lamp"
        JL_SPRITES[MOD_NAME .. "_" .. iname] = api_define_sprite(iname .. "_animation", "sprites/jellyfish_lamps/" .. iname .. "_animation.png", 4)
        api_define_object({
            id = lowercase_color_name .. "_jellyfish_lamp",
            name = JL_COLORS[i] .. " Jellyfish Lamp",
            category = "Decorations",
            tooltip = "A " .. lowercase_color_name .. " jellyfish lamp. Reminds you of the deep sea.",
            shop_key = false,
            shop_buy = 0,
            shop_sell = 0,
            tools = {"hammer1"}
        }, "sprites/jellyfish_lamps/" .. lowercase_color_name .. "_jellyfish_lamp_item.png", "jellyfish_lamp_animation")
    end
    --api_give_item("community_decorations_red_jellyfish_lamp", 1)
end

function jellyfish_lamp_animation(obj_id)
    cam = api_get_cam()
    ox = api_gp(obj_id, "x")
    oy = api_gp(obj_id, "y")
    hl = api_get_highlighted("obj")
    if hl ~= nil and hl == obj_id then
        api_draw_sprite(JL_SPRITES[api_gp(obj_id, "oid")], (TIME % 2) + 2, ox, oy)
    else
        api_draw_sprite(JL_SPRITES[api_gp(obj_id, "oid")], (TIME % 2), ox, oy)
    end
end