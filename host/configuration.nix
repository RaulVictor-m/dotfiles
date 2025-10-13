{ config, lib, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = ["nix-command" "flakes"];
  environment.variables.EDITOR = "kak";

  system.stateVersion = "25.05"; 
}

