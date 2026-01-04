{pkgs, ... }:

{
  home.packages = with pkgs; [
    kakoune-lsp
  ];

  programs.kakoune.plugins = with pkgs; [
    kakounePlugins.kakoune-lsp
  ];

  programs.kakoune.extraConfig = ''
    eval %sh{kak-lsp}
    lsp-enable

    lsp-inline-diagnostics-disable global
    lsp-diagnostics-lines-disable global
  '';
}
