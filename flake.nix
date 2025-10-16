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

    defaultSysModules = [
        ./host/configuration.nix
        ./host/locale.nix
        ./host/networking.nix
        ./host/packages.nix
        ./host/system.nix
        ./host/xsession.nix
        ./host/shell.nix
      ];
  in {
    nixosConfigurations.desktop = nixpkgs.lib.nixosSystem {
      inherit pkgs;
      modules = defaultSysModules ++ [
        ./host/audio.nix
        ./host/desktop-system.nix
        ./host/desktop-hardware.nix
        ];

      specialArgs = {
          inherit user pkgs-unstable;
      };

    };

    nixosConfigurations.vm = nixpkgs.lib.nixosSystem {
      inherit pkgs;
      modules = defaultSysModules ++ [
        ./host/audio.nix
        ./host/vm-system.nix
        ./host/vm-hardware.nix
      ];

      specialArgs = {
          inherit user pkgs-unstable;
      };

    };

    nixosConfigurations.laptop = nixpkgs.lib.nixosSystem {
      inherit pkgs;
      modules = defaultSysModules ++ [
        ./host/laptop.nix
        ./host/laptop-system.nix
        ./host/laptop-hardware.nix
      ];

      specialArgs = {
          inherit user pkgs-unstable;
      };

    };

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
  };
}
