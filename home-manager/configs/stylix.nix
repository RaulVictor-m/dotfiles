{pkgs, stylix, ... }:

{
  stylix.enable = true;
  stylix.image = ./wallpaper.jpg;
  stylix.polarity = "dark";
  stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/gruber.yaml";

  stylix.targets.gtk.enable = true;

  # stylix.cursor = {
  #   name = "DMZ-Black";
  #   size = 24;
  #   package = pkgs.vanilla-dmz;
  # };

  # stylix.fonts = {
  #   monospace = {
  #     name = "FiraCode Nerd Font";
  #     package = pkgs.nerd-fonts.fira-code;
  #   };
  #   sansSerif = {
  #     name = "Noto Sans";
  #     package = pkgs.noto-fonts;
  #   };
  #   serif = {
  #     name = "Noto Serif";
  #     package = pkgs.noto-fonts;
  #   };
  #   emoji = {
  #     name = "Noto Color Emoji";
  #     package = pkgs.noto-fonts-color-emoji;
  #   };

    # sizes = {
    #   terminal = 6;
    #   # desktop = 16;
    #   # applications = 16;
    #   # popups = 14;
    # };
  # };
}
