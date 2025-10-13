{pkgs, ...}:

let
  my-dwm = import ./dwm/dwm.nix {inherit pkgs;};
in
{
  home.file.".xinitrc".text = ''
    feh --gb-scale ~/dotfiles/home-manager/configs/wallpaper.jpg &
    exec dwm
  '';

  home.packages = with pkgs; [
    my-dwm
  ];
}
