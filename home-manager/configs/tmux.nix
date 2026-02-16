{pkgs, ... }:

{
  programs.tmux = {
    enable = true;
    keyMode = "vi";
    prefix = "C-Space";
    baseIndex = 1;

    escapeTime = 10;

    # set -g automatic-rename off
    # set -g allow-rename off
    extraConfig = ''
      set -g default-terminal "tmux-256color"
      set -ag terminal-overrides ",xterm-256color:RGB"
      set-option -as terminal-features ",foot:RGB,alacritty:RGB,xterm-256color:RGB"
      set -sg repeat-time 600
      set -g status-interval 30
      set -g history-limit 500

      set -g mouse off
    '';
  };
}
