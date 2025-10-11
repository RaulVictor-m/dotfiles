{ configs, pkgs, ... }:

{
  programs.qutebrowser.enable = true;

  programs.qutebrowser.enable.settings = {
    colors.webpage.darkmode.enabled = true;
  };
}
