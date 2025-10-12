{ config, lib, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
    ];


  nix.settings.experimental-features = ["nix-command" "flakes"];
  environment.variables.EDITOR = "kak";

  system.stateVersion = "25.05"; 
}

