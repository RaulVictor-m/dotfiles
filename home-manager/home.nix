{ config, pkgs, user, ... }:

{
  home.username = user;
  home.homeDirectory = "/home/${user}";
  home.stateVersion = "25.05";

  programs.home-manager.enable = true;
}
