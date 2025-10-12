{ config, lib, pkgs, ... }:

{
  nix.registry.sys {
    to = {
      type = "path";
      path = ../.;
    };
    exact = false;
  };

  users.defaultUserShell = pkgs.fish;
}

