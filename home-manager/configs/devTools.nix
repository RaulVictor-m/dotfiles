{pkgs, ... }:

{
  programs.git = {
    enable = true;

    settings = {
      user = {
        name = "RaulVictor-m";
        email = "raulvictor822@gmail.com";
      };

      alias = {
        lg = "log --oneline --graph --decorate";
      };

      core.editor = "kak";
      init.defaultBranch = "main";
      color.ui = "auto";
    };

  };

}
