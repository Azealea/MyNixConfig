{ pkgs-stable, ... }: {
  # enables vm
  virtualisation.libvirtd.enable = true;
  programs.virt-manager = {
    enable = true;
    package = pkgs-stable.virt-manager;
  };
}

