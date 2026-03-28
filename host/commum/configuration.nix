{ config, lib, pkgs, ... }:

{
  nix.settings.experimental-features = ["nix-command" "flakes"];
  nix.settings.trusted-users = ["root" "@wheel"];
  environment.variables.EDITOR = "kak";
  environment.variables.TERM = "xterm-256color";
  environment.variables.WINIT_X11_SCALE_FACTOR= 1;
  services.dbus.enable = true;
  documentation.dev.enable = true;

  system.stateVersion = "25.05";
}

