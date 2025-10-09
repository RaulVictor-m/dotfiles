{ config, pkgs, ... }:

{
  home.username = "raul";
  home.homeDirectory = "/home/raul";
  home.stateVersion = "24.11";

  programs.home-manager.enable = true;

  imports = [
    ./modules/wm.nix
    ./modules/packages.nix
    ./modules/devTools.nix
    ./modules/configs.nix
  ];
}
