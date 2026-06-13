{pkgs, ...}: {
  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [mesa intel-media-driver];
  };
  # hardware.enableRedistributableFirmware = true;
}
