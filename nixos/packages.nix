{ pkgs, ... }: {
	nixpkgs.config = {
		allowUnfree = true;
		permittedInsecurePackages = ["python-2.7.18.8" "electron-25.9.0"];
	};

	environment.systemPackages = with pkgs; [
# Desktop apps

		kitty
#			rofi
			wofi
			discord
			gparted
			obsidian
			vim
			firefox
                        kdePackages.dolphin
			prismlauncher

# Coding stuff
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
                        meld
# CLI utils
#                        zsh-powerlevel10k
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
			nix-search
			bluez
			bluez-tools
			dunst

# REALLY IMPORTANT STUFF DONT TOUCH
			qt6.qtbase # required for running sddm
			qt6.qtsvg
			qt6.qtvirtualkeyboard
			qt6.qtmultimedia
			qt5.qtwayland
			qt6.qtwayland
			libsForQt5.qt5.qtquickcontrols2
			libsForQt5.qt5.qtgraphicaleffects
			libsForQt5.qt5.qtsvg

# Wayland stuff
			xwayland
			wl-clipboard
			cliphist
			waybar
			hyprland
                        brightnessctl
# Sound
			pipewire
			pavucontrol
			pulseaudio
			pamixer

# Screenshotting
			hyprshot

# Other
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
