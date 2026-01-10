{ config, pkgs, user, ... }:

{
  networking.interfaces.enp5s0.wakeOnLan.enable = true;
  programs.xwayland.enable = true;
}
