{ config, lib, pkgs, user, pkgs-unstable, ... }:

{
  users.users."${user}" = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" ]; 
    initialPassword = "__nixos__";
    packages = with pkgs; [
      dmenu

      gcc
      gnumake

      unzip
      gnutar

      pkgs-unstable.qutebrowser
      brave
      alacritty
      st
      foot
      zathura
      typst
      feh
      fish

      fastfetch
      inxi
      xclip

      kakoune
      tmux

      home-manager
      nh
    ];
  };

  environment.systemPackages = with pkgs; [
    linux-firmware

    kakoune
    curl
    git
    python3
    openscad

    gcc
    gnumake
    gdb
    gf
    pkgs-unstable.zig
    pkgs-unstable.nim
    go
    gopls

    pkgs-unstable.qutebrowser
    brave
    chromium
    alacritty
    st
    foot
    zathura
    typst
    libreoffice
    mpv
    fish
    zsh

    fastfetch
    feh
    xclip
    xdo
    xdotool
    man-pages
    man-pages-posix

    # utils
    brightnessctl
    coreutils
    pkg-config
    clang
    objconv
    tree
    time
    file
    openssh
    dust
    fzf
    btop
    htop
    inxi
    tldr
    killall

    zip
    unzip
    gnutar
    p7zip

    # custom pkgs
    (import ./packages/clipboard.nix {inherit pkgs;})
  ];
}
