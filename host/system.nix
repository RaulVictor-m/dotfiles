{ config, lib, pkgs, ... }:

{
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda";

  zramSwap.enable = true;
  zramSwap.memoryPercent = 25;
}
