{
security.rtkit.enable = true;
services.pipewire = {
  enable = true;
  alsa.enable = true;
  alsa.support32Bit = true;
  pulse.enable = true;
};
  services.pulseaudio.enable = false;
##  sound.enable = true;
#
#  # rtkit is optional but recommended
#  security.rtkit.enable = true;
#
}
