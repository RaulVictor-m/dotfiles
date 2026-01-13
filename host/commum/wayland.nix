{ config, pkgs, ... }:

{
  programs.xwayland.enable = true;
  programs.sway.enable = true;

  xdg.portal = {
    enable = true;
    wlr.enable = true;
  };

  environment.systemPackages = with pkgs; [
    waybar
    wl-clipboard
    swaybg
    swaylock
    wmenu
    hypridle
    wlr-randr
  ];
}
