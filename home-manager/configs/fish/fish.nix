{pkgs, ...}:

{
  home.file.".config/fish/functions" = {
    source = ./functions;
    recursive = true;
  };
}
