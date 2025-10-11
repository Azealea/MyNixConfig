{
  programs.wlogout = {
    enable = true;
    layout = [
      {
        label = "lock";
        action = "hyprlock";
        text = "  Lock  ";
        keybind = "l";
      }
      {
        label = "reboot";
        action = "systemctl reboot";
        text = " Reboot ";
        keybind = "r";
      }
      {
        label = "shutdown";
        action = "systemctl poweroff";
        text = "Shutdown";
        keybind = "s";
      }
    ];
    style = ./style.css;
  };

  xdg.configFile."wlogout/icons/lock.png".source = ./icons/lock.png;
  xdg.configFile."wlogout/icons/reboot.png".source = ./icons/reboot.png;
  xdg.configFile."wlogout/icons/shutdown.png".source = ./icons/shutdown.png;
}
