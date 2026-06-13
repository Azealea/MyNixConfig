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
    nvf.url = "github:notashelf/nvf";
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    zen-browser,
    nvf,
    ...
  } @ inputs: let
    username = "azea";
    configDir = "$HOME/MyNixConfig";
  in {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      modules = [
        home-manager.nixosModules.home-manager
        nvf.nixosModules.default
        ./hosts/nixos
        ./modules
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
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
