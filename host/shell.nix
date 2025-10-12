{ config, lib, pkgs, user, ... }:

{
  nix.registry.sys {
    to = {
      type = "path";
      path = ../.;
    };
    exact = false;
  };

  users.defaultUserShell = pkgs.bash;
  users.users."${user}".shell = pkgs.bash;
}

