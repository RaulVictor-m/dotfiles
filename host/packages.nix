{ config, lib, pkgs, ... }:

{
  users.users.raul = {
    isNormalUser = true;
    extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
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

      fastfetch
      inxi
      xclip

      kakoune
      tmux

      home-manager
    ];
  };

  environment.systemPackages = with pkgs; [
    kakoune
    curl
    git

    gcc
    gnumake

    unzip
    gnutar

    fastfetch
    inxi
    xclip
  ];
}
