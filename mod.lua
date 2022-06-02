MOD_NAME = "community_decorations"

function register()
    return {
        name = MOD_NAME,
        hooks = {},
        modules = {"cloth_tables", "beanbags", "stools", "crafting", "recipes", "constants"}
    }
end

function init()
    define_cloth_tables()
    define_beanbags()
    define_stools()

    -- define_recipes and define_deco_workbench() should be the last definitions called
    define_recipes()
    define_deco_workbench()
    return "Success"
end
