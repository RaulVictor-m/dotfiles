{ config, pkgs, ... }:

{
  programs.steam.enable = true;

  #bluetooth
  hardware.bluetooth = {
    enable = true;
    package = pkgs.bluez;
    powerOnBoot = true;
    settings = {
      General = {
        Experimental = true;
        FastConnectable = true;
        ControllerMode = "dual";
      };
      Policy = {
        AutoEnable = true;
      };
    };
  };

  services.blueman.enable = true;

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
