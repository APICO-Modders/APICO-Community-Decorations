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
    -- define_deco_workbench() should be the last definition called
    define_deco_workbench()
    return "Success"
end
