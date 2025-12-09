{ config, lib, pkgs, ... }:

{
  nix.settings.experimental-features = ["nix-command" "flakes"];
  environment.variables.EDITOR = "kak";
  environment.variables.TERM = "xterm-256color";

  system.stateVersion = "25.05"; 
}

