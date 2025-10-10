{ config, pkgs, dwm, system, ... }:

{
  home.packages = [
    dwm.packages.${system}.dwm
  ];
}
