{pkgs, ... }:

{
  programs.tmux = {
    enable = true;
    keyMode = "vi";
    terminal = "screen-256color";
    prefix = "C-Space";
    baseIndex = 1;
    historyLimit = 5000;

    escapeTime = 10;

    extraConfig = ''
      # set -g default-terminal "xterm-256color"
      
      set -ag terminal-overrides ",xterm-256color:RGB"
      set-option -a terminal-features "alacritty:RGB"
      set -sg repeat-time 600
    '';
  };
}
