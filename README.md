# Nix Config

## First instalation

Its simpler if the repo is directly in the $HOME directory

change global variable in flake.nix:
- username
- configDir : the path to the config folder ( if you dont put the repo in $HOME )

cp /etc/nixos/hardware-configuration.nix ~/MyNixConfig/

## TODO

- nicer dolphin theme
- more scripts to have a better desktop experience:
    - power profile selector
    - exit menu
- configure rofi or wofi to have a better theme
- better mouse icon


## Known bugs


If you connect too quickly on the sddm menu, will put you back at the default tty interface not launching Hyprland
