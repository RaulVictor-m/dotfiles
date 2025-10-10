{ config, pkgs, ... }:

{
  home.sessionVariables = {
    EDITOR = "kak";
  };
  programs.kakoune.enable = true;
  programs.kakoune.defaultEditor = true;

  programs.kakoune.config = {
    colorScheme = "gruvbox-dark";
    showMatching = true;
    indentWidth  = 4;

    wrapLines = {
      enable = true;
      word = true;
      indent = true;
    };

    ui.assistant = "cat";
  };

  programs.kakoune.extraConfig = ''
    add-highlighter global/ show-whitespaces -spc '•' -indent '•'
    add-highlighter global/ number-lines -relative -hlcursor -min-digits 3 -separator " " -cursor-separator "▏"

    map -docstring "comment selected lines" global user c ":comment-line<ret>"
    map -docstring "yank to the system clipboard" global user y '<a-|>xclip -i -selection clipboard <ret>'
    map -docstring "paste from the system clipboard" global user p '<a-!>xclip -o -selection clipboard <ret>'

    map -docstring "enter in lsp mode " global user l ":enter-user-mode lsp<ret>"
    map -docstring "lsp hover over the cursor" global user k ":lsp-hover<ret>"

    map -docstring "open fzf" global user f ": fzf-mode<ret>"
  '';
}
