{pkgs, ...}:

{
  editorconfig.enable = true;
  editorconfig.setting = {
    root = true;

    "*" = {
      indent_style = space;
      indent_size  = 4;
    };

    "*.nim" = {
      indent_style = space;
      indent_size  = 2;
    };

    "*.nim" = {
      indent_style = space;
      indent_size  = 2;
    };
  };
}

