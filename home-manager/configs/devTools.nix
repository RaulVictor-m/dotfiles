{pkgs, ... }:

{
  programs.git = {
    enable = true;

    settings = {
      user = {
        userName = "RaulVictor-m";
        userEmail = "raulvictor822@gmail.com";
      };

      aliases = {
        lg = "log --oneline --graph --decorate";
      };

      core.editor = "kak";
      init.defaultBranch = "main";
      color.ui = "auto";
    };

  };

}
