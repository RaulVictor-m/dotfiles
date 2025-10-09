{ config, pkgs, ... }:

{
  home.packages = [
    pkgs.kakoune
    pkgs.git

    pkgs.gcc
  ];

  programs.git = {
    enable = true;
    userName = "RaulVictor-m";
    userEmail = "raulvictor822@gmail.com";

    extraConfig = {
      core.editor = "kak";
      init.defaultBranch = "main";
      color.ui = "auto";
    };

    aliases = {
      lg = "log --oneline --graph --decorate";
    };
  };

  home.sessionVariables = {
    EDITOR = "kak";
  };
}
