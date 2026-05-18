-- Hyprland Lua Configuration
-- Translated from original hyprland.conf

----------------
---- SOURCE ----
----------------
-- (Assuming sourcing behavior or importing configuration uses traditional Lua or API)
-- If theme.conf is also a Lua file, you would use: require("theme")
-- If it's a legacy conf, it's typically left to be handled by the main file or migrated.

------------------
---- MONITORS ----
------------------

require("theme")

hl.monitor({
    output   = "DP-3",
    mode     = "1920x1080@74.97",
    position = "0x0",
    scale    = "1",
})

hl.monitor({
    output   = "HDMI-A-2",
    mode     = "1920x1080@60",
    position = "1920x0",
    scale    = "1",
})

---------------------
---- MY PROGRAMS ----
---------------------

local terminal    = "kitty"
local fileManager = "dolphin"
local menu        = "wofi --show drun"

-------------------
---- AUTOSTART ----
-------------------

hl.on("hyprland.start", function()
    hl.exec_cmd("waybar")
    -- hl.exec_cmd("hyprpaper")
    hl.exec_cmd("sleep 1; \"$HOME/.config/hypr/scripts/random_wallpaper.sh\"")

    hl.exec_cmd("udiskie")
    hl.exec_cmd("wl-paste --type text --watch cliphist store")
    hl.exec_cmd("wl-paste --type image --watch cliphist store")

    -- Autostart apps silently onto targeted workspaces
    hl.exec_cmd("hyprctl dispatch exec \"[workspace 2 silent] zen-browser\"")
    hl.exec_cmd("hyprctl dispatch exec \"[workspace 6 silent] discord\"")
    hl.exec_cmd("hyprctl dispatch exec \"[workspace special:magic silent; float; size 1280 720] kitty\"")

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

---------------------
---- KEYBINDINGS ----
---------------------

local mainMod = "SUPER"

-- Core operations
hl.bind(mainMod .. " + Q", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + W", hl.dsp.window.close())
-- hl.bind(mainMod .. " + M", hl.dsp.exit())
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen())
hl.bind(mainMod .. " + S", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + SPACE", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())
-- hl.bind(mainMod .. " + J", hl.dsp.layout("togglesplit"))

-- Move focus (Vim keys)
hl.bind(mainMod .. " + H", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + L", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + K", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + J", hl.dsp.focus({ direction = "down" }))

-- Move windows (Vim keys)
hl.bind(mainMod .. " + SHIFT + H", hl.dsp.window.move({ direction = "left" }))
hl.bind(mainMod .. " + SHIFT + L", hl.dsp.window.move({ direction = "right" }))
hl.bind(mainMod .. " + SHIFT + K", hl.dsp.window.move({ direction = "up" }))
hl.bind(mainMod .. " + SHIFT + J", hl.dsp.window.move({ direction = "down" }))

-- Resize windows (Vim keys)
hl.bind(mainMod .. " + CTRL + H", hl.dsp.window.resize({ x = -40, y = 0, true }))
hl.bind(mainMod .. " + CTRL + J", hl.dsp.window.resize({ x = 0, y = 40, true }))
hl.bind(mainMod .. " + CTRL + K", hl.dsp.window.resize({ x = 0, y = -40, true }))
hl.bind(mainMod .. " + CTRL + L", hl.dsp.window.resize({ x = 40, y = 0, true }))

-- Workspaces: Switch & Move Silent
for i = 1, 10 do
    local key = i % 10 -- Maps 10 to 0
    hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
    hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i, silent = true }))
end

-- Special workspace (Scratchpad)
hl.bind(mainMod .. " + RETURN", hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + RETURN", hl.dsp.window.move({ workspace = "special:magic", silent = true }))

-- Utilities & Custom Scripts
hl.bind(mainMod .. " + V", hl.dsp.exec_cmd("cliphist list | wofi -dmenu -display-columns 2 | cliphist decode | wl-copy"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.exec_cmd("hyprshot -m region -o $HOME/Screenshots/ | satty --filename -"))
hl.bind(mainMod .. " + CTRL + T", hl.dsp.exec_cmd("sh $HOME/Scripts/theme-selector.sh"))
hl.bind(mainMod .. " + CTRL + W", hl.dsp.exec_cmd("sh $HOME/.config/hypr/scripts/random_wallpaper.sh"))

-- Mouse Binds (Dragging & Resizing)
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Multimedia keys (Volume & Brightness)
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"),
    { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
    { locked = true, repeating = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
    { locked = true, repeating = true })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
    { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"), { locked = true, repeating = true })

-- Media Control Keys
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })


--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------

-- Bind workspaces to specific monitors
for w = 1, 5 do
    hl.workspace_rule({ workspace = tostring(w), monitor = "DP-3" })
end
for w = 6, 10 do
    hl.workspace_rule({ workspace = tostring(w), monitor = "HDMI-A-2" })
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

-- Show title bars only on floating windows (Disabling hyprbars on tiled)
hl.window_rule({
    name  = "floating-only-bars",
    match = { float = false },
    -- hyprbars = {
    --     no_bar = true,
    -- },
})

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
hl.workspace_rule({ workspace = "w[t1]", gaps_out = 0, gaps_in = 0 })

hl.window_rule({
    name     = "single-window-gapless",
    match    = { workspace = "w[t1]" },
    rounding = 0,
})
