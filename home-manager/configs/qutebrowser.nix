{pkgs, ... }:

{
  programs.qutebrowser.enable = true;

  programs.qutebrowser.settings = {
    colors.webpage.darkmode.enabled = true;
  };
}
