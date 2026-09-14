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
    permittedInsecurePackages = [];
  };

  environment.systemPackages = with pkgs; [
    # Desktop apps
    kitty
    vesktop
    gparted
    vim
    pcmanfm
    prismlauncher
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
    uv

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
    ripgrep
    zip

    # REALLY IMPORTANT STUFF DONT TOUCH UNLESS U KNOW WHAT TO DO

    # Wayland stuff
    wl-clipboard

    # utility
    hyprpicker

    # Sound
    pavucontrol
    pamixer

    # Screenshotting
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
