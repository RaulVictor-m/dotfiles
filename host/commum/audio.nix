{ config, lib, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    pavucontrol
  ];

  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    jack.enable = true;
    pulse.enable = true;
  };
}
