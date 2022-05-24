MOD_NAME = "community_decorations"

function register()
    return {
        name = MOD_NAME,
        hooks = {},
        modules = {"cloth_tables", "constants"}
    }
end

function init()
    define_cloth_tables()

    return "Success"
end