{ config, pkgs, user, ... }:

{
  networking.interfaces.enp5s0.wakeOnLan.enable = true;
  services.hardware.openrgb.enable = true;
  services.hardware.openrgb.package = pkgs.openrgb-with-all-plugins;
  boot.kernelModules = [ "i2c-dev" ];
}
