MOD_NAME = "community_decorations"

function register()
    return {
        name = MOD_NAME,
        hooks = {},
        modules = {"cloth_tables", "beanbags", "stools", "crafting", "constants"}
    }
end

function init()
    define_cloth_tables()
    define_beanbags()
    define_stools()
    dw_define_recipe({{"log", 10}, {"stone", 5}}, "community_decorations_white_stool", 1)
    -- this should be the last definition called
    define_deco_workbench()
    return "Success"
end
