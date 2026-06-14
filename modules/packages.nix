{
  pkgs,
  configDir,
  ...
}: {
  programs.nh = {
    enable = true;
    flake = configDir;
  };

  nixpkgs.config = {
    allowUnfree = true;
    permittedInsecurePackages = ["python-2.7.18.8" "electron-25.9.0"];
  };

  environment.systemPackages = with pkgs; [
    # Desktop apps
    kitty
    rofi
    imagemagick
    vscode
    discord
    gparted
    obsidian
    vim
    pcmanfm
    prismlauncher
    dunst
    libnotify
    networkmanagerapplet
    krita

    # Coding stuff
    man-pages
    gnumake
    gcc_latest
    bear
    nodejs
    python3
    llvmPackages_latest.clang-tools
    valgrind
    gdb
    lua
    meld

    # CLI utils
    tig
    tmate
    fastfetch
    file
    tree
    wget
    git
    btop
    unzip
    bat
    fd
    zip
    bluez
    bluez-tools

    # REALLY IMPORTANT STUFF DONT TOUCH UNLESS U KNOW WHAT TO DO

    # Wayland stuff
    awww
    wl-clipboard

    # utility
    brightnessctl
    cliphist

    # Sound
    pavucontrol
    pamixer

    # Screenshotting
    hyprshot
    hyprpicker
    wl-screenrec
  ];

  fonts.packages = with pkgs; [
    jetbrains-mono
    font-awesome
    nerd-fonts.jetbrains-mono
    powerline-fonts
    powerline-symbols
  ];
}
