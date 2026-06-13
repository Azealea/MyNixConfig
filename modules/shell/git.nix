{username, ...}: {
  home-manager.users.${username}.programs.git = {
    enable = true;
    settings.user = {
      name = "Azealea";
      email = "auhubert6@gmail.com";
    };
  };
}
