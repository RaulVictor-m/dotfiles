{
  description = "Home config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    home-manager.url = "github:nix-community/home-manager/release-25.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    dwm.url = "path:./home-manager/configs/dwm";
  };

  outputs = { self, nixpkgs, home-manager, dwm, ... }:
  let
    system = "x86_64-linux";
  in {
    nixosConfigurations.host = nixpkgs.lib.nixosSystem {
      pkgs = import nixpkgs { inherit system; };
      modules = [
        ./host/configuration.nix
      ];

    };

    homeConfigurations.raul = home-manager.lib.homeManagerConfiguration {
      pkgs = import nixpkgs { inherit system; };
      modules = [
        ./home-manager/home.nix
        ./home-manager/configs/kak.nix
        ./home-manager/configs/devTools.nix
        ./home-manager/configs/dwm/dwm.nix
        ./home-manager/configs/qutebrowser.nix
        ./home-manager/configs/alacritty.nix
      ];
      extraSpecialArgs = {inherit dwm system; };
    };
  };
}
