{
  description = "Home config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    home-manager.url = "github:nix-community/home-manager/release-25.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager, ... }:
  let
    system = "x86_64-linux";
    user = "raul";
  in {
    nixosConfigurations.host = nixpkgs.lib.nixosSystem {
      pkgs = import nixpkgs { inherit system; };
      modules = [
        ./host/configuration.nix
        ./host/audio.nix
        ./host/locale.nix
        ./host/networking.nix
        ./host/packages.nix
        ./host/system.nix
        ./host/xsession.nix
        ./host/shell.nix
      ];

      specialArgs = {
          inherit user;
      };

    };

    homeConfigurations."${user}" = home-manager.lib.homeManagerConfiguration {
      pkgs = import nixpkgs { inherit system; };
      modules = [
        ./home-manager/home.nix
        ./home-manager/configs/devTools.nix
        ./home-manager/configs/wm.nix

        ./home-manager/configs/kak.nix
        ./home-manager/configs/fish/fish.nix
        ./home-manager/configs/editorconfig.nix
        ./home-manager/configs/qutebrowser.nix
        ./home-manager/configs/alacritty.nix
      ];

      extraSpecialArgs = {
          inherit user;
      };

    };
  };
}
