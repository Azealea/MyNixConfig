# Nixos Config

## First instalation

Its simpler if the repo is directly in the $HOME directory

change global variable in flake.nix:
- username
- configDir : the path to the config folder ( if you dont put the repo in $HOME )

cp /etc/nixos/hardware-configuration.nix ~/MyNixConfig/

## TODO

- [ ] more scripts to have a better desktop experience:
    - [ ] power profile selector
    - [X] exit menu -> wlogout
    - [ ] make brighnesstctl wrapper
- [X] configure rofi to have a better theme
- [X] better mouse icon
- [ ] bluetooth better widget
- [ ] same for nm
- [ ] cool widget that'd be funny
- [X] change ssdm for something else -> changed to ly
- [X] vim config -> neovim with nvf
- [X] boot.loader.systemd-boot.configurationLimit = 5; and garbage collect

