{
  description = "My system configuration";

  inputs = {

    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    zen-browser.url = "github:0xc000022070/zen-browser-flake";

  };

  outputs = { self, nixpkgs, home-manager, zen-browser, ... }@inputs:

    let
      system = "x86_64-linux";
      username = "azea";
      configDir = "$HOME/MyNixConfig";
    in {

    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      inherit system;
      modules = [
        ./nixos/configuration.nix
      ];
      specialArgs = { inherit inputs username configDir; };
    };

    homeConfigurations.${username} = home-manager.lib.homeManagerConfiguration {
      pkgs = nixpkgs.legacyPackages.${system};
      modules = [ ./home-manager/home.nix ];
      extraSpecialArgs = { inherit inputs username configDir; };
    };
  };
}
