{ config, pkgs, ... }:

{
  programs.steam.enable = true;

  #bluetooth
  hardware.bluetooth.enable = true;
  services.blueman.enable = true;
  # services.blueman-applet.enable = true;
  services.dbus.packages = with pkgs; [ blueman ];

  environment.systemPackages = with pkgs; [
    parsec-bin
    kitty
    discord

    steam

    bluez
    blueman
  ];
}
