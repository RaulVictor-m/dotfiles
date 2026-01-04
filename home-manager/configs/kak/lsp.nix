{pkgs, pkgs-unstable, ... }:

{
  home.packages = with pkgs; [
    pkgs-unstable.zls
    pkgs-unstable.nimlsp
    llvmPackages_20.clang-tools
    kakoune-lsp
  ];

  programs.kakoune.plugins = with pkgs; [
    kakounePlugins.kakoune-lsp
  ];

  programs.kakoune.extraConfig = ''
    eval %sh{kak-lsp}
    lsp-enable

    lsp-inline-diagnostics-disable global
    lsp-diagnostic-lines-disable global
  '';
}
