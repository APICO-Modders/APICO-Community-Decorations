MOD_NAME = "community_decorations"

function register()
    return {
        name = MOD_NAME,
        hooks = {},
        modules = {"cloth_tables", "beanbags", "stools", "constants", "utils"}
    }
end

function init()
    define_cloth_tables()
    define_beanbags()
    define_stools()

    return "Success"
end