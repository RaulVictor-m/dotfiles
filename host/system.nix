{ config, lib, pkgs, ... }:

{
  hardware.enableRedistributableFirmware = true;
  hardware.enableAllFirmware = true;

  zramSwap.enable = true;
  zramSwap.memoryPercent = 25;
}
