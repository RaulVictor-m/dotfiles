{ config, lib, pkgs, ... }:

{
  nix.settings.experimental-features = ["nix-command" "flakes"];
  environment.variables.EDITOR = "kak";
  environment.variables.TERM = "xterm-256color";
  environment.variables.WINIT_X11_SCALE_FACTOR= 1;
  services.dbus.enable = true;

  system.stateVersion = "25.05";
}

