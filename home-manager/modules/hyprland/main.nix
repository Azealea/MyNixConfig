{
  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = true;
    settings = {
      env = [
        # Hint Electron apps to use Wayland
        "NIXOS_OZONE_WL,1"
        "XDG_CURRENT_DESKTOP,Hyprland"
        "XDG_SESSION_TYPE,wayland"
        "XDG_SESSION_DESKTOP,Hyprland"
        "QT_QPA_PLATFORM,wayland"
        "XDG_SCREENSHOTS_DIR,$HOME/screens"
      ];

      monitor = ",1920x1200@60,auto,1";
      #       monitor = ",1600x1000@60,auto,1";
      "$mainMod" = "SUPER";
      "$terminal" = "kitty";
      "$menu" = "wofi";

      exec-once = [
        "swww-daemon"
        "waybar"
        "wl-paste --type text --watch cliphist store"
        "wl-paste --type image --watch cliphist store"
      ];

      general = {
        gaps_in = 0;
        gaps_out = 0;

        border_size = 5;

        "col.active_border" = "rgba(d65d0eff) rgba(98971aff) 45deg";
        "col.inactive_border" = "rgba(3c3836ff)";

        resize_on_border = true;

        allow_tearing = false;
        layout = "master";
      };

      misc = {
        background_color = "0x00000000";
        disable_hyprland_logo = "true";
      };

      decoration = {
        rounding = 0;

        active_opacity = 1.0;
        inactive_opacity = 1.0;

        shadow = {
          enabled = false;
        };

        blur = {
          enabled = true;
          size = 16;
          passes = 2;
          new_optimizations = true;
        };
      };

      animations = {
        enabled = true;

        bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";
        # bezier = "myBezier, 0.33, 0.82, 0.9, -0.08";

        animation = [
          "windows,     1, 7,  myBezier"
          "windowsOut,  1, 7,  default, popin 80%"
          "border,      1, 10, default"
          "borderangle, 1, 8,  default"
          "fade,        1, 7,  default"
          "workspaces,  1, 6,  default"
        ];
      };

      input = {
        kb_layout = "us";
        kb_options = caps:escape;
        touchpad = {
          natural_scroll = true;
        };
      };

      dwindle = {
        pseudotile = true;
        preserve_split = true;
      };

      master = {
        new_status = "slave";
        new_on_top = true;
        mfact = 0.5;
      };

      misc = {
        #force_default_wallpaper = 0;
        #disable_hyprland_logo = true;
      };

windowrule = [

  # --- Workspace t1, no border
  "match:workspace w[t1], border_size 0, float 0"

  # --- Media players and showmethekey float
  "match:class ^(mpv|imv|showmethekey-gtk)$, float on"

  # --- showmethekey pinned overlay
  "match:class ^(showmethekey-gtk)$, move 990 60, size 900 170, pin on, no_initial_focus on, no_focus on, border_size 0"

  # --- Zen-beta and Discord workspace assignment
  "match:class ^(zen-beta)$, workspace 1"
  "match:class ^(discord)$, workspace 5"

  # --- Prevent maximize globally
  "match:class .*, suppress_event maximize"

  # --- xwaylandvideobridge helper
  "match:class ^(xwaylandvideobridge)$, opacity 0.0 override, no_anim on, no_initial_focus on, max_size 1 1, no_blur on, no_focus on"

];


      workspace = [
        "w[tv1], gapsout:0, gapsin:0"
        "f[1], gapsout:0, gapsin:0"
      ];
    };

    extraConfig = ''
       gesture=3,horizontal,workspace
       gesture=4,up,dispatcher,exec,hyprlock
      '';
  };
}
