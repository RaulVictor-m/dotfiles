{ config, pkgs, ... }:

{
  #bluetooth
  hardware.bluetooth = {
    enable = true;
    package = pkgs.bluez-experimental;
    powerOnBoot = true;
    settings = {
      General = {
        Experimental = true;
      };
    };
  };

  environment.systemPackages = with pkgs; [
    bluez
    bluez-experimental
    bluez-headers

    bluetuith
  ];
}
