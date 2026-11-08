{username, ...}: {
  programs.noctalia = {
    enable = true;
    systemd.enable = true;
    recommendedServices.enable = true;
  };

  home-manager.users.${username}.programs.noctalia = {
    enable = true;
    systemd.enable = true;
    settings = ./noctalia.toml; # noctalia config export
  };
}
