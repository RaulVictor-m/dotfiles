{ config, pkgs, ... }:

{
  programs.steam.enable = true;
  programs.mango.enable = true;
  environment.systemPackages = with pkgs; [
    parsec-bin
    kitty
    discord
    obs-studio

    steam

    libappindicator-gtk3
    ntfs3g

    wl-clipboard
    swaybg
    swaylock
    wmenu
  ];
}
