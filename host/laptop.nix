{ config, lib, pkgs, ... }:

{
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

  boot.blacklistedKernelModules = [ "bluetooth" "btusb" ]; # if unused

  services.libinput.enable = true;
  services.tlp.enable = true;
}
