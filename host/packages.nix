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

      qutebrowser
      brave
      alacritty
      zathura
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

    unzip
    gnutar

    qutebrowser
    brave
    chromium
    alacritty
    zathura
    fish

    fastfetch
    inxi
    feh
    xclip
    fzf

    # utils
    coreutils
    pkg-config
    clang
    objconv
    tree
    time
    file
    openssh
    dust
  ];
}
