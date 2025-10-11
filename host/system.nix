{ config, lib, pkgs, ... }:

{
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda";

  services.libinput.enable = true;
}
