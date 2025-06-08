{ pkgs, ... }: {
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

# CLI utils
#                        zsh-powerlevel10k
                        tig
                        meld
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

# REALLY IMPORTANT STUFF DONT TOUCH UNLESS U KNOW WHAT TO DO

# Wayland stuff
                        #xwayland
                        swww
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
                        hyprpicker

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
