{nixpkgs, user, pkgs, pkgs-unstable}:
let
  defaultSysModules = [
    ./commum/configuration.nix
    ./commum/locale.nix
    ./commum/networking.nix
    ./commum/packages.nix
    ./commum/system.nix
    ./commum/xsession.nix
    ./commum/shell.nix
  ];

in {
  desktop = nixpkgs.lib.nixosSystem {
    inherit pkgs;
    modules = defaultSysModules ++ [
      ./commum/audio.nix
      ./desktop/configuration.nix
      ./desktop/system.nix
      ./desktop/hardware.nix
      ];

    specialArgs = {
        inherit user pkgs-unstable;
    };
  };

  vm = nixpkgs.lib.nixosSystem {
    inherit pkgs;
    modules = defaultSysModules ++ [
      ./commum/audio.nix
      ./vm/system.nix
      ./vm/hardware.nix
    ];

    specialArgs = {
        inherit user pkgs-unstable;
    };

  };

  laptop = nixpkgs.lib.nixosSystem {
    inherit pkgs;
    modules = defaultSysModules ++ [
      ./laptop/configuration.nix
      ./laptop/system.nix
      ./laptop/hardware.nix
    ];

    specialArgs = {
        inherit user pkgs-unstable;
    };

  };
}
