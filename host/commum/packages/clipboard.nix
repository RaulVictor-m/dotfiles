{pkgs}:

pkgs.stdenv.mkDerivation {
  pname = "xwl_clip";
  version = "1.0";
  buildInputs = [];

  dontUnpack = true;
  src = null;

  installPhase = ''
    mkdir -p $out/bin
    echo '#!/usr/bin/env bash
      # Detect session type
      session=''${XDG_SESSION_TYPE:-}

      if [ "$session" = "wayland" ]; then
          # Wayland
          case "$1" in
              copy) wl-copy "''${@:2}" ;;
              paste) wl-paste ;;
              *) echo "Usage: $0 {copy|paste}" ;;
          esac
      else
          # Xorg or fallback
          case "$1" in
              copy) xclip -selection clipboard "''${@:2}" ;;
              paste) xclip -selection clipboard -o ;;
              *) echo "Usage: $0 {copy|paste}" ;;
          esac
      fi' > $out/bin/xwl_clip
    chmod +x $out/bin/xwl_clip
  '';
}
