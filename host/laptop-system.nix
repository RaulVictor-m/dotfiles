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

    "acpi_osi=!"
    "rootdelay=10"
    "intel_idle.max_cstate=1"
    "i915.enable_psr=0"
    "i915.force_probe=*"
  ];

  boot.kernel.sysctl = {
      "vm.swappiness" = 15;
      "vm.vfs_cache_pressure" = 50;
  };

  boot.kernelModules = [ "battery" "acpi" "i915" ];

  boot.blacklistedKernelModules = [
    #"intel_pmc_core" #potencial problem
    #"dw_dmac_core"   #potencial problem
    "bluetooth"
    "btusb" ];
}
