{ config, pkgs, ... }:

{
  home.packages = [
    pkgs.alacritty
    pkgs.qutebrowser
  ];
}
