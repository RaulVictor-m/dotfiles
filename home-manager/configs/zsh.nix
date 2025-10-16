{pkgs, user, ...}:

{
  programs.zsh = {
    enable = true;
    plugins = [
      {
        name = "zsh-helix-mode";
        name = pkgs.zsh-helix-mode;
        file = "share/zsh-helix-mode/zsh-helix-mode.plugin.zsh";
      }
    ];
    enableCompletion = true;
    interactiveShellInit = ''
    '';
  };
}
