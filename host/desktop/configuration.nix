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
    package = pkgs.bluez-experimental;
    powerOnBoot = true;
    settings = {
      General = {
        Experimental = true;
      };
    };
  };

  #graphics
  hardware.graphics.enable = true;
  hardware.graphics.extraPackages = with pkgs; [
    libva-vdpau-driver
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
    bluez-experimental
    bluez-headers

    bluetuith

    libappindicator-gtk3
    ffmpeg-full
    ntfs3g
  ];

}
