{ configs, pkgs, ... }:

{
  programs.qutebrowser.enable = true;

  programs.qutebrowser.settings = {
    content.user_stylesheets = "";
    colors.webpage.darkmode.enable = true;
    colors.webpage.darkmode.policy.images = "never";

    quickmarks = {
      yt = "https://youtube.com";
      gh = "https://github.com";
      gpt = "https://chatgpt.com";
    }
  };



}
