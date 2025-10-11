{ config, lib, pkgs, ... }:

{
  users.users.raul = {
    isNormalUser = true;
    extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
    initialPassword = "__nixos__";
    packages = with pkgs; [
      i3
      i3status
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
    ];
  };

  environment.systemPackages = with pkgs; [
    kakoune
    curl

    gcc
    gnumake

    unzip
    gnutar

    fastfetch
    inxi
    xclip
  ];
}
