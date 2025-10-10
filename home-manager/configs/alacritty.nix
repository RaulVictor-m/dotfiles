{ config, pkgs, ... }:

{
  programs.alacritty.enable = true;
  programs.alacritty.font = {
    size = 12;
    family = "Source Code Pro";
  };
}
