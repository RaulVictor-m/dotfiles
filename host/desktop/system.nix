{ config, lib, pkgs, ... }:

{
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "nodev";
  boot.loader.grub.efiSupport = true;
  boot.loader.grub.useOSProber = true;
  boot.loader.grub.theme = "${pkgs.kdePackages.breeze-grub}/grub/themes/breeze";

  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.efi.efiSysMountPoint = "/boot/efi";

  swapDevices = [
    {
      device = "/var/swapfile";
      size = 8192;
    }
  ];

  boot.kernel.sysctl = {
      "vm.swappiness" = 15;
      # "vm.vfs_cache_pressure" = 50;
  };
}
