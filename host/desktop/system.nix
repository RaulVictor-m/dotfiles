{ config, lib, pkgs, ... }:

{
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.efi.efiSysMountPoint = "/boot/efi";
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "nodev";
  boot.loader.grub.efiSupport = true;
  boot.loader.grub.theme = "${pkgs.kdePackages.breeze-grub}/grub/themes/breeze";
  # boot.loader.grub.useOSProber = true;
  boot.loader.grub.extraEntries = ''
    menuentry "Windows" {
      insmod part_gpt
      insmod fat
      insmod search_fs_uuid
      insmod chain
      search --fs-uuid --set=root 5cac4678-7d83-4f61-a7a1-e3360add7320
      chainloader /EFI/Microsoft/Boot/bootmgfw.efi
    }
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

  boot.kernel.sysctl = {
      "vm.swappiness" = 15;
      # "vm.vfs_cache_pressure" = 50;
  };
}
