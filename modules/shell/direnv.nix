{username, ...}: {
  home-manager.users.${username}.programs.direnv = {
    enable = true;
    enableZshIntegration = true;
    nix-direnv.enable = true;
  };
}
