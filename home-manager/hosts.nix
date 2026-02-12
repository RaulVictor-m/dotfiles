{pkgs, pkgs-unstable, user, home-manager, stylix}:

{
  "${user}" = home-manager.lib.homeManagerConfiguration {
    inherit pkgs;
    modules = [
      stylix.homeModules.stylix
      ./home.nix
      ./configs/stylix.nix
      ./configs/devTools.nix
      ./configs/tmux.nix
      ./configs/wm.nix

      ./configs/kak/kak.nix
      ./configs/kak/lsp.nix
      ./configs/fish/fish.nix
      ./configs/zsh.nix
      ./configs/editorconfig.nix
      ./configs/qutebrowser.nix
      ./configs/alacritty/alacritty.nix
    ];

    extraSpecialArgs = {
        inherit user pkgs-unstable;
    };
  };

  "${user}-desktop" = home-manager.lib.homeManagerConfiguration {
    inherit pkgs;
    modules = [
      stylix.homeModules.stylix
      ./home.nix
      ./configs/stylix.nix
      ./configs/devTools.nix
      ./configs/tmux.nix
      ./configs/wm.nix
      ./configs/mango/mango.nix
      ./configs/mango/waybar.nix

      ./configs/kak/kak.nix
      ./configs/kak/lsp.nix
      ./configs/fish/fish.nix
      ./configs/zsh.nix
      ./configs/editorconfig.nix
      ./configs/qutebrowser.nix
      ./configs/alacritty/alacritty-desktop.nix
    ];


    extraSpecialArgs = {
        inherit user pkgs-unstable;
    };
  };
}
