DECO_WORKBENCH_RECIPES = {}
RECIPE_SLOT_AMOUNT = 5
SLOT_SPR = -1
RECIPE_SPR = -1
ARROW_SPR = -1
TAB_1_SPR = -1
TAB_1_SELECTED_SPR = -1
TAB_2_SPR = -1
TAB_2_SELECTED_SPR = -1
CAN_CRAFT_SPR = -1
CANT_CRAFT_SPR = -1
SPR_REF = {}

function prep_deco_workbench()
	SLOT_SPR = api_define_sprite("workbench_item_slot", "sprites/crafting/dw_item_slot.png", 2)
	RECIPE_SPR = api_define_sprite("workbench_recipe_slot", "sprites/crafting/dw_recipe_slot.png", 1)
	ARROW_SPR = api_define_sprite("workbench_arrow", "sprites/crafting/dw_arrow.png", 1)
	CAN_CRAFT_SPR = api_define_sprite("workbench_craft", "sprites/crafting/dw_craft.png", 2)
	CANT_CRAFT_SPR = api_define_sprite("workbench_craft_error", "sprites//crafting/dw_craft_error.png", 2)
	TAB_1_SPR = api_define_sprite("workbench_tab_1", "sprites/crafting/dw_tab_1.png", 2)
	TAB_1_SELECTED_SPR = api_define_sprite("workbench_tab_1_s", "sprites/crafting/dw_tab_1_selected.png", 2)
	TAB_2_SPR = api_define_sprite("workbench_tab_2", "sprites/crafting/dw_tab_2.png", 2)
	TAB_2_SELECTED_SPR = api_define_sprite("workbench_tab_2_s", "sprites/crafting/dw_tab_2_selected.png", 2)
end

function define_deco_workbench()
	prep_deco_workbench()
    api_define_menu_object({
        id = "decoration_workbench",
        name = "Decoration Workbench",
        category = "Crafting",
        tooltip = "Used for crafting items from the Community Decorations mod.",
        shop_key = false,
        shop_buy = 0,
        shop_sell = 0,
        layout = {},
        buttons = {"Help", "Target", "Close"},
        info = {},
        tools = {"mouse1", "hammer1"},
    	placeable = true
    }, "sprites/crafting/decoration_workbench.png", "sprites/crafting/decoration_workbench_gui.png", {
        define = "deco_workbench_define",
		draw = "deco_workbench_draw",
		--tick = "deco_workbench_tick"
    }, nil)
	api_log("spr_ref", SPR_REF)
end

function deco_workbench_define(menu_id)
	api_dp(menu_id, "tab", "tab1")
	api_dp(menu_id, "selected_item", "community_decorations_white_stool")
	api_dp(menu_id, "selected_recipe", DECO_WORKBENCH_RECIPES[2])
	api_dp(menu_id, "invalid", false)
	api_dp(menu_id, "ingredient1", "log")
	api_dp(menu_id, "ingredient1_amount", 2)
	api_dp(menu_id, "ingredient2", nil)
	api_dp(menu_id, "ingredient3", nil)

	-- tabs
	api_define_button(menu_id, "tab1", 6, 16, "tab1", "dw_tab_click", "sprites/crafting/dw_tab_1_selected.png")
	api_define_button(menu_id, "tab2", 27, 16, "tab2", "dw_tab_click", "sprites/crafting/dw_tab_2.png")
	for i=1,5 do
		api_define_button(menu_id, "recipe" .. i, 8 + 21 * (i - 1), 30, "", "dw_recipe_click", "sprites/crafting/dw_slot.png")
		api_log("button", i)
	end
	for i=1,#DECO_WORKBENCH_RECIPES do
		api_sp(api_gp(menu_id, "recipe" .. i), "text", DECO_WORKBENCH_RECIPES[i][2][1])
	end
end

function deco_workbench_draw(menu_id)
	cam = api_get_cam()
	api_draw_button(api_gp(menu_id, "tab1"), false)
	api_draw_button(api_gp(menu_id, "tab2"), false)
	for i=1,#DECO_WORKBENCH_RECIPES do
		recipe = api_gp(menu_id, "recipe" .. i)
		recipe_oid = api_gp(recipe, "text")
		api_draw_button(recipe, false)
		api_draw_sprite(SPR_REF[recipe_oid], 0, api_gp(recipe, "x") - cam["x"], api_gp(recipe, "y") - cam["y"])
	end

	if api_gp(menu_id, "selected_item") ~= nil then
		ingredient1 = api_gp(menu_id, "ingredient1")
		ingredient2 = api_gp(menu_id, "ingredient2")
		ingredient3 = api_gp(menu_id, "ingredient3")
		--recipe_length = #api_gp(menu_id, "selected_recipe")[1]
		recipe_length = 1
		offset = 0
		if recipe_length == 1 then
			-- draw middle sprite
			api_draw_sprite(SLOT_SPR, 0, api_gp(menu_id, "x") - cam["x"] + 158, api_gp(menu_id, "y") - cam["y"] + 20)
			api_draw_sprite(SPR_REF[ingredient1], 0, api_gp(menu_id, "x") - cam["x"] + 160, api_gp(menu_id, "y") - cam["y"] + 22)
		elseif recipe_length == 2 then
			-- draw the left sprite
			api_draw_sprite(SLOT_SPR, 0, api_gp(menu_id, "x") - cam["x"] + 158 - 19, api_gp(menu_id, "y") - cam["y"] + 20)
			api_draw_sprite(SPR_REF[ingredient1], 0, api_gp(menu_id, "x") - cam["x"] + 160 - 19, api_gp(menu_id, "y") - cam["y"] + 22)
			-- draw the right sprite
			api_draw_sprite(SLOT_SPR, 0, api_gp(menu_id, "x") - cam["x"] + 158 + 19, api_gp(menu_id, "y") - cam["y"] + 20)
			api_draw_sprite(SPR_REF[ingredient2], 0, api_gp(menu_id, "x") - cam["x"] + 160 + 19, api_gp(menu_id, "y") - cam["y"] + 22)
		else
			-- draw the left sprite
			api_draw_sprite(SLOT_SPR, 0, api_gp(menu_id, "x") - cam["x"] + 158 - 39, api_gp(menu_id, "y") - cam["y"] + 20)
			api_draw_sprite(SPR_REF[ingredient1], 0, api_gp(menu_id, "x") - cam["x"] + 160 - 39, api_gp(menu_id, "y") - cam["y"] + 22)
			-- draw middle sprite
			api_draw_sprite(SLOT_SPR, 0, api_gp(menu_id, "x") - cam["x"] + 158, api_gp(menu_id, "y") - cam["y"] + 20)
			api_draw_sprite(SPR_REF[ingredient2], 0, api_gp(menu_id, "x") - cam["x"] + 160, api_gp(menu_id, "y") - cam["y"] + 22)
			-- draw the right sprite
			api_draw_sprite(SLOT_SPR, 0, api_gp(menu_id, "x") - cam["x"] + 158 + 39, api_gp(menu_id, "y") - cam["y"] + 20)
			api_draw_sprite(SPR_REF[ingredient3], 0, api_gp(menu_id, "x") - cam["x"] + 160 + 39, api_gp(menu_id, "y") - cam["y"] + 22)
		end
	end
end

function dw_define_recipe(input_table, output, num)
	table.insert(DECO_WORKBENCH_RECIPES, {input_table, {output, num}})
	for i=1,#input_table do
		SPR_REF[input_table[i][1]] = api_get_sprite("sp_" .. input_table[i][1])
	end
	SPR_REF[output] = api_get_sprite("sp_" .. output)
end

function dw_recipe_click(menu_id)
	api_log("button", "click !")
end

function dw_tab_click(menu_id)
	api_log(menu_id)
end

function add_tables(t1,t2)
    for i=1,#t2 do
        t1[#t1+1] = t2[i]
    end
    return t1
end

function get_sprites_in_recipes(inp)
	sprites = {}
	
	if type(inp) == "table" then
		for i=1,#inp do
			sprites = add_tables(sprites, fn_for_tbl(inp[i]))
		end
	else
		return {inp}
	end
	api_log("sprites", sprites)
	return sprites
end
