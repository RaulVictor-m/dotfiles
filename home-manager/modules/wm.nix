{ config, pkgs, ... }:

{
  xsession.enable = true;
  xsession.windowManager.command = "i3";

  home.sessionVariables = {
    DISPLAY = ":0";
  };

  home.packages = with pkgs; [
      i3
      xorg.xinit
      xterm

      libinput

      dmenu
      feh
  ];
}
