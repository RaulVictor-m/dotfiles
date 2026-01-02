{ config, lib, pkgs, ... }:

{
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.efi.efiSysMountPoint = "/boot/efi";
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "nodev";
  boot.loader.grub.efiSupport = true;
  boot.loader.grub.theme = "${pkgs.kdePackages.breeze-grub}/grub/themes/breeze";
  boot.loader.grub.useOSProber = true;
  boot.loader.grub.extraConfig = ''
    set gfxmode=1920x1080
    set gfxpayload=keep
    terminal_output gfxterm
  '';

  boot.loader.grub.extraEntries = ''
    menuentry "Reboot" {
      reboot
    }
    menuentry "Poweroff" {
      halt
    }
    menuentry "uefi-firmware" {
      fwsetup
    }
  '';

  swapDevices = [
    {
      device = "/var/swapfile";
      size = 8192;
    }
  ];

  boot.kernelParams = [
    "video=card1-HDMI-A-1:1920x1080@60D"
  ];

  boot.kernel.sysctl = {
      "vm.swappiness" = 15;
      # "vm.vfs_cache_pressure" = 50;
  };
}
