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
      set -g default-terminal "screen-256color"
      set -sg repeat-time 600
    '';
  };
}
