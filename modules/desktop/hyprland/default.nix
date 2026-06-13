{
  imports = [
    ./binds.nix
    ./hypridle.nix
    ./hyprlock.nix
    ./hyprpaper.nix
    ./main.nix
  ];

  programs.hyprland.enable = true;
}
