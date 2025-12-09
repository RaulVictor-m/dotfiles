{pkgs, ... }:

{
  programs.alacritty.enable = true;
  programs.alacritty.settings.env.TERM = "xterm-256color";
  # programs.alacritty.settings.font.size = 16;
  # programs.alacritty.settings.font.normal.family = "monospace";
  programs.alacritty.settings.window.padding = {x = 20; y = 20;};
}
