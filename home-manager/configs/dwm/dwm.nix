{pkgs}:

pkgs.stdenv.mkDerivation {
  pname  = "dwm";
  version = "1.0";
  buildInputs = with pkgs; [
    libX11
    libXft
    libXinerama
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
}
