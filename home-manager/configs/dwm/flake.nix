{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
  };

  outputs = { self, nixpkgs }:
  let
    system = "x86_64-linux";
    pkgs = import nixpkgs {inherit system; };
  in {

    packages.${system}.dwm = pkgs.stdenv.mkDerivation {
      pname  = "dwm";
      version = "1.0";

      buildInputs = with pkgs; [
        xorg.libX11
        xorg.libXft
        xorg.libXinerama
        gnumake
        gcc
        pkg-config
        stdenv.cc
      ];

      src = ./.;

      installPhase = ''
        pkg-config --cflags x11
        make
        mkdir -p $out/bin
        cp dwm $out/bin
      '';
    };
    devShells.${system}.default = pkgs.mkShell {
      packages = with pkgs; [
        xorg.libX11
        xorg.libXft
        xorg.libXinerama
        gnumake
        gcc
        pkg-config
        stdenv.cc
      ];
    };

  };

}
