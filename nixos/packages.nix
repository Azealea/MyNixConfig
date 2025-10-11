{pkgs, ...}: {
  nixpkgs.config = {
    allowUnfree = true;
    permittedInsecurePackages = ["python-2.7.18.8" "electron-25.9.0"];
  };

  environment.systemPackages = with pkgs; [
    # Desktop apps

    kitty
    rofi
    #			wofi
    vscode
    discord
    gparted
    obsidian
    vim
    kdePackages.dolphin
    prismlauncher
    dunst
    networkmanagerapplet

    # Coding stuff
    man-pages
    gnumake
    gcc
    bear
    nodejs
    python
    llvmPackages_latest.clang
    llvmPackages_latest.llvm
    llvmPackages_latest.libclang
    llvmPackages_latest.lld
    llvmPackages_latest.clang-tools
    valgrind
    gdb
    lua
    meld

    # CLI utils
    tig
    tmate
    neofetch
    file
    tree
    wget
    git
    btop
    unzip
    bat
    zip
    bluez
    bluez-tools

    # REALLY IMPORTANT STUFF DONT TOUCH UNLESS U KNOW WHAT TO DO

    # Wayland stuff
    swww
    wl-clipboard

    # utility
    brightnessctl
    cliphist

    # Sound
    pipewire
    pavucontrol
    pulseaudio
    pamixer

    # Screenshotting
    hyprshot
    hyprpicker

    # home manager
    home-manager
  ];

  fonts.packages = with pkgs; [
    jetbrains-mono
    font-awesome
    nerd-fonts.jetbrains-mono
    powerline-fonts
    powerline-symbols
  ];
}
