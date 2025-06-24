{ pkgs, ... }:
  let
  sddm-corners = pkgs.stdenv.mkDerivation {
    pname = "sddm-corners-theme";
    version = "1.0.0";
    src = pkgs.fetchzip {
      url = "https://github.com/HyDE-Project/HyDE/raw/refs/heads/master/Source/arcs/Sddm_Corners.tar.gz";
      sha256 = "sha256-5f3M4tLkSnFU69C+wSH3y4ssqFconQu47A+7XP7ZbH4=";
    };
    installPhase = ''
      mkdir -p $out/share/sddm/themes/Corners
      cp -r * $out/share/sddm/themes/Corners
    '';
    meta = with pkgs.lib; {
      description = "Corners theme for SDDM";
      license = licenses.gpl3;
      platforms = platforms.linux;
    };
  };
in {
  environment.systemPackages = [ sddm-corners ];
#    services.displayManager.sessionPackages = [ pkgs.hyprland ];
    services.displayManager.sddm = {
      enable = true;
      package = pkgs.libsForQt5.sddm;
      theme = "Corners";
      wayland.enable = true;
      extraPackages = with pkgs; [
        libsForQt5.sddm
        libsForQt5.sddm-kcm
        libsForQt5.qtsvg
        libsForQt5.qtmultimedia
        libsForQt5.qtquickcontrols2
        libsForQt5.qtgraphicaleffects
        libsForQt5.layer-shell-qt
        libsForQt5.qt5.qtwayland
        sddm-corners
#        Bibata-Modern-Ice
      ];
      settings = {
       Theme = {
          ThemeDir = "/run/current-system/sw/share/sddm/themes";
#          CursorTheme = "Bibata-Modern-Ice";
#          CursorSize = "24";
        };
        General = {
          # Set default session globally
          DefaultSession = "hyprland.desktop";
        };
        Wayland = {
          EnableHiDPI = true;
        };
      };
    };
}

