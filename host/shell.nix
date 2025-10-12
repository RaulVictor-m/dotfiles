{ config, lib, pkgs, user, ... }:

{
  nix.registry.sys = {
    to = {
      type = "path";
      path = ../.;
    };
    exact = false;
  };

  users.defaultUserShell = pkgs.fish;
  programs.fish.enable = true;
  users.users."${user}".shell = pkgs.fish;
}

