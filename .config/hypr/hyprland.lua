require("theme")
require("monitors")
require("keybinds")

-------------------
---- AUTOSTART ----
-------------------

hl.on("hyprland.start", function()
    hl.exec_cmd("waybar") -- bar
    hl.exec_cmd("dunst") -- notifications
    hl.exec_cmd("hyprpaper") -- wallpaper
    hl.exec_cmd("sleep 1; \"$HOME/.config/hypr/scripts/random_wallpaper.sh\"") -- apply random wallpaper

    hl.exec_cmd("udiskie")
    hl.exec_cmd("wl-paste --type text --watch cliphist store")
    hl.exec_cmd("wl-paste --type image --watch cliphist store")

    -- Autostart apps silently onto targeted workspaces
    hl.exec_cmd("zen-browser", { workspace = "1 silent" })
    hl.exec_cmd("discord", { workspace = "6 silent" })
    hl.exec_cmd("kitty", { workspace = "special:magic silent", float = true, size = {1280, 720}})

    hl.exec_cmd("hyprpm enable hyprbars")
end)

-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------

hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")
hl.env("XDG_MENU_PREFIX", "arch-")

-----------------------
---- LOOK AND FEEL ----
-----------------------

hl.config({
    general = {
        layout = "dwindle",
    },

    dwindle = {
        preserve_split = true,
        force_split = 2,
    },

    master = {
        new_status = "master",
        new_on_top = 1,
    },

    misc = {
        force_default_wallpaper = 0,
        disable_hyprland_logo   = false,
    },
})

---------------
---- INPUT ----
---------------

hl.config({
    input = {
        kb_layout          = "gb",
        kb_variant         = "",
        kb_model           = "",
        kb_options         = "",
        kb_rules           = "",

        numlock_by_default = 1,
        repeat_rate        = 40,
        repeat_delay       = 250,

        follow_mouse       = 2,
        accel_profile      = "flat",
        sensitivity        = 0,

        touchpad           = {
            natural_scroll = false,
        },
    },
})

-- Cursor & Gesture blocks
hl.config({
    cursor = {
        no_warps = true,
    }
})

hl.gesture({
    fingers   = 3,
    direction = "horizontal",
    action    = "workspace"
})


--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------

-- Bind workspaces to specific monitors
for w = 1, 10 do
    hl.workspace_rule({ workspace = tostring(w), monitor = "DP-3" })
end

-- Suppress maximize events
hl.window_rule({
    name           = "suppress-maximize-events",
    match          = { class = ".*" },
    suppress_event = "maximize",
})

-- Picture-in-Picture Floating rule
hl.window_rule({
    name  = "floating-pip",
    match = { title = "(Picture-in-Picture)" },
    float = true,
})

-- discord
hl.window_rule({
    match = { class = "discord" },
    workspace = "6 silent",
})

-- zen
hl.window_rule({
    match = { class = "zen" },
    workspace = "2 silent",
})

-- Show title bars only on floating windows (Disabling hyprbars on tiled)
-- hl.window_rule({
--     name  = "floating-only-bars",
--     match = { float = false },
--     hyprbars = {
--         no_bar = true,
--     },
-- })

-- Color SSH Windows
hl.window_rule({
    name         = "color-ssh-windows",
    match        = { title = ".*ssh.*" },
    border_color = { colors = { "rgba(ff4800ee)", "rgba(ff33b8ee)" }, angle = 45 },
    -- hyprbars     = {
    --     bar_color = "rgb(ff4800)",
    -- },
})

-- Gapless with only 1 window
hl.workspace_rule({ workspace = "w[tv1]", gaps_out = 0, gaps_in = 0 })
hl.workspace_rule({ workspace = "f[1]", gaps_out = 0, gaps_in = 0 })

hl.window_rule({
    name     = "no-gaps-wtv1",
    match    = { workspace = "w[tv1]" },
    rounding = 0,
    border_size = 0
})

hl.window_rule({
    name     = "no-gaps-f1",
    match    = { workspace = "f[1]" },
    rounding = 0,
    border_size = 0
})
