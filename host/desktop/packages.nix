{ config, pkgs, ... }:

{
  programs.steam.enable = true;
  environment.systemPackages = with pkgs; [
    parsec-bin
    kitty
    discord
    obs-studio

    steam

    libappindicator-gtk3
    ntfs3g
  ];
}
