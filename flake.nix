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

    hosts-nixos = import ./host/hosts.nix {inherit pkgs pkgs-unstable user nixpkgs;};
    hosts-hm = import ./home-manager/hosts.nix {inherit pkgs user home-manager;};

  in {

    nixosConfigurations = hosts-nixos;
    homeConfigurations = hosts-hm;

    packages.${system} = { stable = pkgs; unstable = pkgs-unstable;};
  };
}
