{pkgs, user, home-manager}:

{
  "${user}" = home-manager.lib.homeManagerConfiguration {
    inherit pkgs;
    modules = [
      ./home.nix
      ./configs/devTools.nix
      ./configs/wm.nix

      ./configs/kak.nix
      ./configs/fish/fish.nix
      ./configs/zsh.nix
      ./configs/editorconfig.nix
      ./configs/qutebrowser.nix
      ./configs/alacritty.nix
    ];

    extraSpecialArgs = {
        inherit user;
    };
  };

  "${user}-desktop" = home-manager.lib.homeManagerConfiguration {
    inherit pkgs;
    modules = [
      ./home.nix
      ./configs/devTools.nix
      ./configs/wm.nix

      # ./configs/bluetooth.nix

      ./configs/kak.nix
      ./configs/fish/fish.nix
      ./configs/zsh.nix
      ./configs/editorconfig.nix
      ./configs/qutebrowser.nix
      ./configs/alacritty.nix
    ];


    extraSpecialArgs = {
        inherit user;
    };
  };
}
