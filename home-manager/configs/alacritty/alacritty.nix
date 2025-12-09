{pkgs, ... }:

{
  programs.alacritty.enable = true;
  programs.alacritty.settings.env.TERM = "xterm-256color";
  programs.alacritty.settings.window.padding = {x = 20; y = 20;};

  programs.alacritty.settings.terminal.shell = {
    program = "${pkgs.tmux}/bin/tmux";
    args = ["new-session" "-A" "-s" "main"];
  };
}
