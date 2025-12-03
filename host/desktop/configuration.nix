{ config, pkgs, ... }:

{
  programs.steam.enable = true;

  #bluetooth
  hardware.bluetooth.enable = true;

  environment.systemPackages = with pkgs; [
    bluez
    blueman
  ];
}
