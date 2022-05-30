MOD_NAME = "community_decorations"
TIME = 0

function register()
    return {
        name = MOD_NAME,
        hooks = {"clock"},
        modules = {"cloth_tables", "beanbags", "stools", "jellyfish_lamps", "constants"}
    }
end

function init()
    define_cloth_tables()
    define_beanbags()
    define_stools()
    define_jellyfish_lamps()

    return "Success"
end

function clock()
    TIME = TIME + 1
    api_log("time", time)
end