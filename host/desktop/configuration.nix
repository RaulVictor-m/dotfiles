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

  #packages
  environment.systemPackages = with pkgs; [
    parsec-bin
    kitty
    discord

    steam

    bluez
    bluetuith

    libappindicator-gtk3
  ];
}
