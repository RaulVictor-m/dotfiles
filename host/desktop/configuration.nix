{ config, pkgs, ... }:

{
  programs.steam.enable = true;

  #bluetooth
  hardware.bluetooth.enable = true;
  services.blueman.enable = true;
  # services.blueman-applet.enable = true;

  environment.systemPackages = with pkgs; [
    parsec-bin
    kitty
    discord

    steam

    bluez
    blueman
  ];
}
