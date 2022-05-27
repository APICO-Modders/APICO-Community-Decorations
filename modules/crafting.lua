function define_deco_workbench()
    api_define_menu_object({
        id = "deco_table",
        name = "Decoration Table",
        category = "Tools",
        tooltip = "Used for crafting items from the Community Decorations mod.",
        shop_buy = 0,
        shop_sell = 0,
        layout = {
          {7, 17},
          {7, 39},
          {30, 17},
          {30, 39},
          {99, 17, "Output"},
          {99, 39, "Output"},
          {122, 17, "Output"},
          {122, 39, "Output"},
          {7, 66},
          {30, 66},
          {53, 66},
          {76, 66},
          {99, 66},
          {122, 66},
        },
        buttons = {"Help", "Target", "Close"},
        info = {
          {"1. Recycle Input", "GREEN"},
          {"2. Recycled Output", "RED"},
          {"3. Extra Storage", "WHITE"},
        },
        tools = {"mouse1", "hammer1"},
        placeable = true
      }, "sprites/decoration_workbench.png", "sprites/decoration_workbench/gui")
end