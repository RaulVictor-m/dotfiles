{ config, pkgs, ... }:

{
  programs.steam.enable = true;

  #bluetooth
  hardware.bluetooth.enable = true;

  #packages
  environment.systemPackages = with pkgs; [
    parsec-bin
    kitty
    discord

    steam

    bluez
    bluetuith
  ];
}
