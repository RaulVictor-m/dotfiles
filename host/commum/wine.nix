{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    wineWowPackages.stable
    winetricks

    # Vulkan / DXVK support
    dxvk
  ];
}
