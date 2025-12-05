{pkgs, ... }:

{
  programs.tmux = {
    enable = true;
    keyMode = "vi";
    terminal = "screen-256color";
    prefix = "C-Space";
    baseIndex = 1;
  };
}
