-----------------------
---- LOOK AND FEEL ----
-----------------------
-- hl.config({
--     plugin = {
--         hyprbars = {
--             enabled = false,
--         }
--     }
-- })


hl.config({
    general = {
        gaps_in       = 7,
        gaps_out      = 25,
        border_size   = 2,

        col           = {
            active_border   = { colors = { "rgb(eceff4)", "rgb(e5e9f0)" }, angle = 45 },
            inactive_border = "rgba(2e3440ff)",
        },

        allow_tearing = false,
    },
})

----------------
---- CURSOR ----
----------------

local cursorTheme = "Simp1e-Nord-Light"

hl.env("HYPRCURSOR_THEME", cursorTheme)
hl.env("HYPRCURSOR_SIZE", "24")
hl.env("XCURSOR_THEME", cursorTheme)
hl.env("XCURSOR_SIZE", "24")

hl.on("hyprland.start", function()
    hl.exec_cmd("gsettings set org.gnome.desktop.interface cursor-theme " .. cursorTheme)
    hl.exec_cmd("hyprctl setcursor " .. cursorTheme)
end)

------------------
---- QT THEME ----
------------------

hl.env("QT_QPA_PLATFORM", "wayland")
hl.env("QT_QPA_PLATFORMTHEME", "qt6ct")

--------------------
---- DECORATION ----
--------------------

hl.config({
    decoration = {
        rounding         = 12,

        active_opacity   = 1.0,
        inactive_opacity = 0.94,

        shadow           = {
            enabled      = true,
            range        = 20,
            render_power = 5,
            color        = "rgba(eceff411)",
        },

        blur             = {
            enabled  = true,
            size     = 5,
            passes   = 2,
            vibrancy = 0.1696,
        },
    },
})

--------------------
---- ANIMATIONS ----
--------------------

hl.config({
    animations = {
        enabled = true,
    },
})

-- Bezier curves
hl.curve("easeOutQuint", { type = "bezier", points = { { 0.23, 1 }, { 0.32, 1 } } })
hl.curve("easeInOutCubic", { type = "bezier", points = { { 0.65, 0.05 }, { 0.36, 1 } } })
hl.curve("linear", { type = "bezier", points = { { 0, 0 }, { 1, 1 } } })
hl.curve("almostLinear", { type = "bezier", points = { { 0.5, 0.5 }, { 0.75, 1 } } })
hl.curve("quick", { type = "bezier", points = { { 0.15, 0 }, { 0.1, 1 } } })

-- Animation mappings
hl.animation({ leaf = "global", enabled = true, speed = 10, bezier = "default" })
hl.animation({ leaf = "border", enabled = true, speed = 5.39, bezier = "easeOutQuint" })
hl.animation({ leaf = "windows", enabled = true, speed = 4.79, bezier = "easeOutQuint" })
hl.animation({ leaf = "windowsIn", enabled = true, speed = 4.1, bezier = "easeOutQuint", style = "popin 87%" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 1.49, bezier = "linear", style = "popin 87%" })
hl.animation({ leaf = "fadeIn", enabled = true, speed = 1.73, bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut", enabled = true, speed = 1.46, bezier = "almostLinear" })
hl.animation({ leaf = "fade", enabled = true, speed = 3.03, bezier = "quick" })
hl.animation({ leaf = "layers", enabled = true, speed = 3.81, bezier = "easeOutQuint" })
hl.animation({ leaf = "layersIn", enabled = true, speed = 4, bezier = "easeOutQuint", style = "fade" })
hl.animation({ leaf = "layersOut", enabled = true, speed = 1.5, bezier = "linear", style = "fade" })
hl.animation({ leaf = "fadeLayersIn", enabled = true, speed = 1.79, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut", enabled = true, speed = 1.39, bezier = "almostLinear" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 2.0, bezier = "easeInOutCubic", style = "slide" })
hl.animation({ leaf = "zoomFactor", enabled = true, speed = 7, bezier = "quick" })

--------------
---- MISC ----
--------------

hl.config({
    misc = {
        col                    = {
            splash = "rgb(d8dee9)",
        },
        splash_font_family     = "Rubik",
        animate_manual_resizes = true,
    },
})

----------------------
---- WINDOW RULES ----
----------------------

hl.window_rule({
    name      = "disable-unfocused-shadow",
    match     = { float = false, focus = false },
    no_shadow = true,
})

-----------------
---- PLUGINS ----
-----------------

-- hl.config({
--     plugin = {
--         hyprbars = {
--             enabled = false,
--             bar_height = 24,
--             ["hyprbars-button"] = { "rgb(bf616a)", 12, "", "hyprctl dispatch killactive" },
--             bar_color = "rgba(eceff4ea)",
--             col = {
--                 text = "rgb(2e3440)",
--             },
--             bar_blur = true,
--             bar_precedence_over_border = false,
--         },
--     },
-- })
