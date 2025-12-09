{pkgs, ... }:

{
  programs.alacritty.enable = true;
  programs.alacritty.settings.env.TERM = "xterm-256color";
  # programs.alacritty.settings.font.size = 6;
  # programs.alacritty.settings.font.normal.family = "monospace";
  programs.alacritty.settings.window.padding = {x = 15; y = 5;};

  programs.alacritty.settings.window.shell.program = "${pkgs.tmux}/bin/tmux";
  programs.alacritty.settings.window.shell.args = "new-session -A -s main";
}
