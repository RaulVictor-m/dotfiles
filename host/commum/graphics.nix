{ config, pkgs, ... }:

{
  #graphics
  hardware.graphics.enable = true;
  hardware.graphics.extraPackages = with pkgs; [
    libva-vdpau-driver
    libvdpau-va-gl
    intel-media-driver
    intel-vaapi-driver
    mesa
  ];

  environment.systemPackages = with pkgs; [
    ffmpeg-full
  ];
}
