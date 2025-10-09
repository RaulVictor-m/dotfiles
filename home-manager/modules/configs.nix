{ config, pkgs, ... }:
{
  home.file.".config/kak" = {
    source = ./../configs/kak;
    recursive = true;
  };

  home.file.".xinitrc" = {
    source = ./../configs/xsession/.xinitrc;
  };
}
