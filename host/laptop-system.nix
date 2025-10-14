{ config, lib, pkgs, ... }:

{
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  zramSwap.algorithm = "lzo";

  swapDevices = [
    {
      device = "/var/swapfile";
      size = 4096;
    }
  ];

  boot.kernelParams = [
    "nowatchdog"
    "elevator=deadline"
    "mitigations=off"
  ];

  boot.kernel.sysctl = {
      "vm.swappiness" = 15;
      "vm.vfs_cache_pressure" = 50;
  };

  boot.kernelModules = [ "battery" "acpi" ];

  boot.blacklistedKernelModules = [ "bluetooth" "btusb" ]; # if unused
}
