{pkgs, ...}:

{
  home.packages = with pkgs; [
      editorconfig-core-c
  ];
  editorconfig.enable = true;
  editorconfig.settings = {
    "*" = {
      indent_style = "space";
      indent_size  = 4;
    };

    "*.nim" = {
      indent_style = "space";
      indent_size  = 2;
    };

    "*.nix" = {
      indent_style = "space";
      indent_size  = 2;
    };
  };
}

