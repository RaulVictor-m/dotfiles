{pkgs, stylix, ... }:

{
  gtk.enable = true;
  home.packages = [ pkgs.dconf ];

  stylix.enable = true;
  stylix.image = ./wallpaper.jpg;
  stylix.polarity = "dark";
  stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/gruber.yaml";

  stylix.autoEnable = true;
  stylix.targets.gtk.enable = true;
  stylix.targets.qutebrowser.enable = false;

  stylix.cursor = {
    name = "DMZ-Black";
    size = 24;
    package = pkgs.vanilla-dmz;
  };


  stylix.fonts = {
    monospace = {
      name = "Monospace";
    };

    sizes = {
      terminal = 17;
      # desktop = 16;
      # applications = 16;
      # popups = 14;
    };
  };

  # packages to force apply style
  programs.foot.enable = true;
  stylix.targets.foot.enable = true;
}
