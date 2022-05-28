MOD_NAME = "community_decorations"

function register()
    return {
        name = MOD_NAME,
        hooks = {},
        modules = {"cloth_tables", "beanbags", "constants", "toilet"}
    }
end

function init()
    define_cloth_tables()
    define_beanbags()
    define_toilet()

    return "Success"
end

