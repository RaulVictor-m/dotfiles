{ config, lib, pkgs, ... }:

{
  services.pipewire.enable = false;
  services.pulseaudio.enable = false;
  services.sshd.enable = false;

  environment.systemPackages = with pkgs; [
    acpi
  ];

  services.libinput.enable = true;
  services.tlp.enable = true;
}
