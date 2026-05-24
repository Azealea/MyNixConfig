{
  wayland.windowManager.hyprland = {
    enable = true;
    configType = "lua";
    systemd.enable = true;
    settings = {
      monitor = {
        output = "";
        mode = "1920x1200@30";
        position = "auto";
        scale = 1;
      };

      env = [
        {_args = ["NIXOS_OZONE_WL" "1"];}
        {_args = ["XDG_CURRENT_DESKTOP" "Hyprland"];}
        {_args = ["XDG_SESSION_TYPE" "wayland"];}
        {_args = ["XDG_SESSION_DESKTOP" "Hyprland"];}
        {_args = ["QT_QPA_PLATFORM" "wayland"];}
        {_args = ["XDG_SCREENSHOTS_DIR" "$HOME/screens"];}
      ];

      config = {
        general = {
          gaps_in = 0;
          gaps_out = 0;
          border_size = 5;
          col = {
            active_border = {
              colors = ["rgba(d65d0eff)" "rgba(98971aff)"];
              angle = 45;
            };
            inactive_border = "rgba(3c3836ff)";
          };
          resize_on_border = true;
          allow_tearing = false;
          layout = "master";
        };

        misc = {
          background_color = "0x00000000";
          disable_hyprland_logo = true;
        };

        decoration = {
          rounding = 0;
          active_opacity = 1.0;
          inactive_opacity = 1.0;
          shadow = {enabled = false;};
          blur = {
            enabled = false;
            size = 16;
            passes = 2;
            new_optimizations = true;
          };
        };

        animations = {enabled = true;};

        input = {
          kb_layout = "us";
          kb_options = "caps:escape";
          touchpad = {natural_scroll = true;};
        };

        dwindle = {
          preserve_split = true;
        };

        master = {
          new_status = "slave";
          new_on_top = true;
          mfact = 0.5;
        };
      };

      curve = {
        _args = [
          "myBezier"
          {
            type = "bezier";
            points = [[0.05 0.9] [0.1 1.05]];
          }
        ];
      };

      animation = [
        {
          leaf = "windows";
          enabled = true;
          speed = 7;
          bezier = "myBezier";
        }
        {
          leaf = "windowsOut";
          enabled = true;
          speed = 7;
          bezier = "default";
          style = "popin 80%";
        }
        {
          leaf = "border";
          enabled = true;
          speed = 10;
          bezier = "default";
        }
        {
          leaf = "borderangle";
          enabled = true;
          speed = 8;
          bezier = "default";
        }
        {
          leaf = "fade";
          enabled = true;
          speed = 7;
          bezier = "default";
        }
        {
          leaf = "workspaces";
          enabled = true;
          speed = 6;
          bezier = "default";
        }
      ];

      gesture = [
        {
          fingers = 3;
          direction = "horizontal";
          action = "workspace";
        }
      ];

      window_rule = [
        {
          name = "no-border-wtv1";
          match = {workspace = "w[t1]";};
          border_size = 0;
        }
        {
          name = "zen-ws1";
          match = {class = "^(zen-beta)$";};
          workspace = 1;
        }
        {
          name = "discord-ws5";
          match = {class = "^(discord)$";};
          workspace = 5;
        }
      ];

      workspace_rule = [
        {
          workspace = "w[tv1]";
          gaps_out = 0;
          gaps_in = 0;
        }
        {
          workspace = "f[1]";
          gaps_out = 0;
          gaps_in = 0;
        }
      ];
    };

    extraConfig = ''
      hl.on("hyprland.start", function()
        hl.exec_cmd("awww-daemon")
        hl.exec_cmd("waybar")
        hl.exec_cmd("wl-paste --type text --watch cliphist store")
        hl.exec_cmd("wl-paste --type image --watch cliphist store")
      end)


      hl.gesture({
        ["action"] = function() hl.exec_cmd("hyprlock") end,
        ["direction"] = "up",
        ["fingers"] = 4
      })

    '';
  };
}
