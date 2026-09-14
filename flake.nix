{
  description = "My system configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };
    noctalia = {
      url = "github:noctalia-dev/noctalia";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    zen-browser,
    noctalia,
    ...
  } @ inputs: let
    username = "azea";
    configDir = "$HOME/MyNixConfig";
  in {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      modules = [
        home-manager.nixosModules.home-manager
        noctalia.nixosModules.default
        ./hosts/nixos
        ./modules
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.sharedModules = [noctalia.homeModules.default];
          home-manager.extraSpecialArgs = {inherit inputs username configDir;};
          home-manager.users.${username}.home = {
            username = username;
            homeDirectory = "/home/${username}";
            stateVersion = "25.05";
            sessionVariables = {
              PATH = "$HOME/.local/bin:$PATH";
              CONFIG_DIR = configDir;
            };
          };
        }
      ];
      specialArgs = {inherit inputs username configDir;};
    };
  };
}
