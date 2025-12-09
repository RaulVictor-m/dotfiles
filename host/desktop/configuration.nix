{ config, pkgs, user, ... }:

{
  programs.steam.enable = true;

  # tailscale
  services.tailscale.enable = true;
  services.openssh = {
    enable = true;
    settings = {
      PasswordAuthentication = false;
      KbdInteractiveAuthentication = false;
      PermitRootLogin = "no";
      AllowUsers = [ "${user}" ];
    };
  };


  #bluetooth
  hardware.bluetooth = {
    enable = true;
    package = pkgs.bluez;
    powerOnBoot = true;
  };

  services.blueman.enable = true;

  #graphics
  hardware.opengl.enable = true;
  hardware.opengl.extraPackages = with pkgs; [
    vaapiIntel
    vaapiVdpau
    libvdpau-va-gl
    intel-media-driver
    intel-vaapi-driver
    mesa
  ];

  #packages
  environment.systemPackages = with pkgs; [
    parsec-bin
    kitty
    discord
    obs-studio

    steam

    bluez
    bluetuith

    libappindicator-gtk3
    ffmpeg-full
  ];

}
