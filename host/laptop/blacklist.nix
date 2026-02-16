{ config, lib, pkgs, ... }:

{
  programs.xwayland.enable = lib.mkForce false;
  xdg.portal.enable = lib.mkForce false;
  programs.sway.enable = lib.mkForce false;
}
