{ config, lib, pkgs, user, ... }:

{
  environment.pathsToLink = [ "/share/zsh" ];

  nix.registry.sys = {
    to = {
      type = "path";
      path = "/home/${user}/dotfiles";
    };
    exact = false;
  };

  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;
  users.users."${user}".shell = pkgs.zsh;
}

