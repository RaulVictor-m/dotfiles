{pkgs, ... }:

{
  programs.alacritty.enable = true;
  programs.alacritty.settings.font.size = 6;
  programs.alacritty.settings.font.normal.family = "monospace";
  programs.alacritty.settings.window.padding = {x = 15; y = 5;};
}
