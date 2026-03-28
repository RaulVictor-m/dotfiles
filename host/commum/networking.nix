{ config, lib, pkgs, user, ... }:

{
  networking.hostName = "nixos";
  networking.networkmanager.enable = true;
  networking.firewall.enable = false;

  # tailscale
  services.tailscale.enable = true;

  # ssh
  services.openssh = {
    enable = true;
    settings = {
      PasswordAuthentication = false;
      KbdInteractiveAuthentication = false;
      PermitRootLogin = "no";
      AllowUsers = [ "${user}" ];
    };
  };

  users.users = {
    "${user}" = {
      openssh.authorizedKeys.keys = [
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJubNZMmt1st/vEjFXyzW8IiVqciKnfA9dgAXPvhekou raul@nixos-laptop"
      ];
    };
  };
}
