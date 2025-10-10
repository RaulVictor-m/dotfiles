{ config, pkgs, ... }:

{
  home.username = "raul";
  home.homeDirectory = "/home/raul";
  home.stateVersion = "25.05";

  programs.home-manager.enable = true;
}
