{
  description = "Home config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
    home-manager.url = "github:nix-community/home-manager/release-24.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager, ... }: 
  let
    system = "x86_64-linux";
  in {
    homeConfigurations.raul = home-manager.lib.homeManagerConfiguration {
      pkgs = import nixpkgs { inherit system; };
      modules = [
        ./home.nix
      ];
    };
  };
}
