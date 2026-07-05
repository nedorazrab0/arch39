-- Hyprland config

local run = "flatpak run"
local lock = "pidof -q hyprlock || hyprlock -q -g 0 --immediate-render"
local terminal = "ghostty --config-default-files=false"
    .. " --config-file=/etc/config.ghostty"

hl.monitor(
    {
        output="",
        mode="preferred",
        position="auto",
        scale=1
    }
)

hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_DESKTOP", "Hyprland")
hl.env("LC_ALL", "C.UTF-8")

hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("CLUTTER_BACKEND", "wayland")
hl.env("SDL_VIDEODRIVER", "wayland")
hl.env("QT_QPA_PLATFORM", "wayland")
hl.env("GDK_BACKEND", "wayland")

hl.env("GDK_DEBUG", "portals")
hl.env("GTK_USE_PORTAL", "1")

hl.env("QT_WAYLAND_DISABLE_WINDOWDECORATION", "1")
hl.env("QT_QPA_PLATFORMTHEME", "gtk3")
hl.env("HYPRCURSOR_SIZE", "24")
hl.env("XCURSOR_SIZE", "24")

hl.env("RADV_PERFTEST", "gpl,video_decode,video_encode")
hl.env("_JAVA_AWT_WM_NONREPARENTING", "1")
hl.env("PYTHON_HISTORY", "/dev/null")
hl.env("QSG_RHI_BACKEND", "vulkan")
hl.env("LD_BIND_NOW", "1")

hl.on(
    "hyprland.start",
    function () 
        hl.exec_cmd("systemctl --user start hyprland-session.target")
        hl.exec_cmd("mako")
        hl.exec_cmd("hypridle -q")
        hl.exec_cmd("wl-clip-persist --clipboard regular")
        hl.exec_cmd("waybar -l off")
        hl.exec_cmd(terminal)
    end
)

hl.on(
    "hyprland.shutdown",
    function()
        os.execute(
            "systemctl --user stop hyprland-session.target && sleep 0.1"
        )
    end
)

hl.config(
    {
        ecosystem={no_donation_nag=true},
        master={new_status="slave"},
        animations={enabled=false},
        debug={full_cm_proto=true},

        general={
            gaps_in=2,
            gaps_out=2,
            border_size=1,
            col={
                active_border = "rgba(ffdd44ff)",
                inactive_border = "rgba(595959aa)"
            },
            allow_tearing=true,
            resize_on_border=false,
            layout="master"
        },
        render={
            new_render_scheduling=true,
            direct_scanout=1
        },
        decoration={
            rounding=0,
            active_opacity=1.0,
            inactive_opacity=1.0,
            shadow={enabled=false},
            blur={enabled=false}
        },
        misc={
            background_color="rgb(101020)",
            disable_splash_rendering=true,
            disable_hyprland_logo=true,
            font_family="Adwaita Sans",
            middle_click_paste=false,
            disable_autoreload=true,
            enable_anr_dialog=false,
            vrr=3
        },
        input={
            kb_layout="us,ru",
            kb_variant="",
            kb_model="",
            kb_options="grp:caps_toggle",
            kb_rules="",
            repeat_delay=200,
            repeat_rate=50,
            follow_mouse=1,
            sensitivity=0,
            accel_profile="flat",
            touchpad={
                disable_while_typing=false,
                natural_scroll=true
            }
        }
    }
)

hl.gesture(
    {
        direction="horizontal",
        action="workspace",
        fingers=3
    }
)

local mod = "SUPER"
hl.bind(
    mod .. " + P",
    hl.dsp.exec_cmd(run .. " org.onlyoffice.desktopeditors")
)
hl.bind(mod .. " + O", hl.dsp.exec_cmd(run .. " com.obsproject.Studio"))
hl.bind(mod .. " + T", hl.dsp.exec_cmd(run .. " org.telegram.desktop"))
hl.bind(mod .. " + D", hl.dsp.exec_cmd(run .. " dev.vencord.Vesktop"))
hl.bind(mod .. " + B", hl.dsp.exec_cmd(run .. " com.brave.Browser"))
hl.bind(mod .. " + RETURN", hl.dsp.exec_cmd(terminal))

hl.bind(
    mod .. " + F",
    hl.dsp.window.fullscreen({mode="fullscreen", action="toggle"})
)
hl.bind(
    mod .. " + SPACE",
    function ()
        hl.dispatch(hl.dsp.exec_cmd(lock))
        hl.dispatch(hl.dsp.exec_cmd("systemctl suspend"))
    end
)
hl.bind(mod .. " + SHIFT + ALT_L", hl.dsp.exec_cmd('grim -l9 -g "$(slurp)"'))
hl.bind(mod .. " + ALT_R", hl.dsp.exec_cmd("systemctl poweroff"))
hl.bind(mod .. " + ALT_L", hl.dsp.exec_cmd("grim -l9"))
hl.bind(mod .. " + M", hl.dsp.force_renderer_reload())
hl.bind(mod .. " + SHIFT + X", hl.dsp.window.kill())
hl.bind(mod .. " + SHIFT + M", hl.dsp.exit())
hl.bind(mod .. " + L", hl.dsp.exec_cmd(lock))
hl.bind(mod .. " + C", hl.dsp.window.close())

hl.bind(mod .. " + left",  hl.dsp.focus({direction="left"}))
hl.bind(mod .. " + right", hl.dsp.focus({direction="right"}))
hl.bind(mod .. " + up",    hl.dsp.focus({direction="up"}))
hl.bind(mod .. " + down",  hl.dsp.focus({direction="down"}))

for i = 1, 10 do
    local key = i % 10
    hl.bind(mod .. " + " .. key, hl.dsp.focus({workspace=i}))
    hl.bind(mod .. " + SHIFT + " .. key, hl.dsp.window.move({workspace=i}))
end

hl.bind(
    mod .. " + Q",
    hl.dsp.exec_cmd("wpctl set-volume -l 1.0 @DEFAULT_AUDIO_SINK@ 7%-"),
    {repeating=true}
)
hl.bind(mod .. " + W",
    hl.dsp.exec_cmd("wpctl set-volume -l 1.0 @DEFAULT_AUDIO_SINK@ 7%+"),
    {repeating=true}
)
hl.bind(
    mod .. " + A",
    hl.dsp.exec_cmd("brightnessctl -q -n10 set 10%-"),
    {repeating=true}
)
hl.bind(
    mod .. " + S",
    hl.dsp.exec_cmd("brightnessctl -q -n10 set 10%+"),
    {repeating=true}
)
hl.bind(mod .. " + Tab", hl.dsp.window.cycle_next({floating=true}))

hl.bind(
    mod .. " + SHIFT + right",
    hl.dsp.window.resize({x=128, y=0, relative=true})
)
hl.bind(
    mod .. " + SHIFT + left",
    hl.dsp.window.resize({x=-128, y=0, relative=true})
)
hl.bind(
    mod .. " + SHIFT + up",
    hl.dsp.window.resize({x=0, y=-128, relative=true})
)
hl.bind(
    mod .. " + SHIFT + down",
    hl.dsp.window.resize({x = 0, y = 128, relative=true})
)

hl.bind(
    mod .. " + CONTROL + right",
    hl.dsp.window.move({x=128, y=0, relative=true})
)
hl.bind(
    mod .. " + CONTROL + left",
    hl.dsp.window.move({x=-128, y=0, relative=true})
)
hl.bind(
    mod .. " + CONTROL + up",
    hl.dsp.window.move({x=0, y=-128, relative=true})
)
hl.bind(
    mod .. " + CONTROL + down",
    hl.dsp.window.move({x=0, y=128, relative=true})
)

hl.window_rule(
    {
        name="brave-on-workspace-2",
        match={class="brave-browser"},
        workspace="2"
    }
)

hl.window_rule(
    {
        name="discord-on-workspace-3",
        match={class="vesktop"},
        workspace="3"
    }
)

hl.window_rule(
    {
        name="telegram-on-workspace-4",
        match={class="org.telegram.desktop"},
        workspace="4"
    }
)

hl.window_rule(
    {
        name="obs-on-workspace-9",
        match={class="com.obsproject.Studio"},
        workspace="9"
    }
)

hl.window_rule(
    {
        name="maximize-portal",
        match={class="xdg-desktop-portal-gtk"},
        maximize=true,
        float=true
    }
)

hl.window_rule(
    {
        name="maximize-share-picker",
        match={class="hyprland-share-picker"},
        maximize=true,
        float=true
    }
)

hl.window_rule(
    {
        name="maximize-open-file-dialog",
        match={title="^(Open a different file)$"},
        maximize=true,
        float=true
    }
)

hl.window_rule(
    {
        name="maximize-save-file-dialog",
        match={title="^(Select file to save to)$"},
        maximize=true,
        float=true
    }
)

hl.window_rule(
    {
        name="suppress-maximize-events",
        match={class=".*"},
        suppress_event="maximize"
    }
)

hl.window_rule(
    {
        name="fix-xwayland-drags",
        match={
            class="^$",
            title="^$",
            xwayland=true,
            float=true,
            fullscreen=false,
            pin=false,
        },
        no_focus=true
    }
)
