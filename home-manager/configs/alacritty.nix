{ config, pkgs, ... }:

{
  programs.alacritty.enable = true;
  programs.alacritty.settings.font.size = 12;
  programs.alacritty.settings.font.normal.family = "monospace";
}
