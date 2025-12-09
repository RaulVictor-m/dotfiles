{pkgs, ...}:

let
  my-dwm = import ./dwm/dwm.nix {inherit pkgs;};
in
{
  home.file.".xinitrc".text = ''
    exec dwm
  '';

  home.packages = with pkgs; [
    my-dwm
  ];
}
