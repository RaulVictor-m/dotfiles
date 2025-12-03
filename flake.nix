{
  description = "Home config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager/release-25.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    zsh-hlx.url = "github:multirious/zsh-helix-mode/main";
    zsh-hlx.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager,nixpkgs-unstable, zsh-hlx, ... }:
  let
    system = "x86_64-linux";
    user = "raul";
    pkgs = import nixpkgs {
      inherit system; config.allowUnfree = true;
      overlays = [zsh-hlx.overlays.default];
    };
    pkgs-unstable = import nixpkgs-unstable { inherit system; config.allowUnfree = true; };

    hosts = import ./host/hosts.nix {inherit pkgs pkgs-unstable user nixpkgs;};

  in {
    nixosConfigurations = hosts;

    homeConfigurations."${user}" = home-manager.lib.homeManagerConfiguration {
      inherit pkgs;
      modules = [
        ./home-manager/home.nix
        ./home-manager/configs/devTools.nix
        ./home-manager/configs/wm.nix

        ./home-manager/configs/kak.nix
        ./home-manager/configs/fish/fish.nix
        ./home-manager/configs/zsh.nix
        ./home-manager/configs/editorconfig.nix
        ./home-manager/configs/qutebrowser.nix
        ./home-manager/configs/alacritty.nix
      ];

      extraSpecialArgs = {
          inherit user;
      };

    };
    packages.${system} = { stable = pkgs; unstable = pkgs-unstable;};
  };
}
