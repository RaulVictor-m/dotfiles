{pkgs, ... }:

{
  home.packages = with pkgs; [
    kakoune-lsp
    kakounePlugins.fzf-kak
  ];

  programs.kakoune.plugins = with pkgs; [
    kakounePlugins.kak-fzf
    kakounePlugins.kakoune-lsp
  ];

  home.sessionVariables = {
    EDITOR = "kak";
  };
  programs.kakoune.enable = true;
  programs.kakoune.defaultEditor = true;


  programs.kakoune.config = {
    colorScheme = "my-gruvbox-dark";
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

    map global insert <tab> "<tab><a-;>:exec -draft 'b@'<ret>"

    set-option global autocomplete prompt
    hook global BufOpenFile [^*]* editorconfig-load
    hook global BufNewFile [^*]* editorconfig-load
  '';

  home.file.".config/kak/colors/my-gruvbox-dark.kak".text = ''
  # gruvbox-dark theme

  evaluate-commands %sh{
      gray="rgb:928374"
      red="rgb:ff3030"
      green="rgb:b8bb26"
      yellow="rgb:fabd2f"
      blue="rgb:83a598"
      purple="rgb:d3869b"
      aqua="rgb:8ec07c"
      orange="rgb:fe8019"

      bg="rgb:161616"
      bg_alpha="rgba:181818a0"
      bg1="rgb:3c3836"
      bg2="rgb:504945"
      bg3="rgb:665c54"
      bg4="rgb:7c6f64"

      fg="rgb:ebdbb2"
      fg_alpha="rgba:ebdbb2a0"
      fg0="rgb:fbf1c7"
      fg2="rgb:d5c4a1"
      fg3="rgb:bdae93"
      fg4="rgb:a89984"

      echo "
          # Code highlighting
          face global value         ''${purple}+f
          face global type          ''${yellow}
          face global variable      ''${blue}
          face global module        ''${green}
          face global function      ''${fg}
          face global string        ''${green}
          face global keyword       ''${red}+f
          face global operator      ''${fg}
          face global attribute     ''${orange}
          face global comment       ''${gray}+i
          face global documentation comment
          face global meta          ''${aqua}
          face global builtin       ''${fg}+b

          # Markdown highlighting
          face global title     ''${green}+b
          face global header    ''${orange}
          face global mono      ''${fg4}
          face global block     ''${aqua}
          face global link      ''${blue}+u
          face global bullet    ''${yellow}
          face global list      ''${fg}

          face global Default            ''${fg},''${bg}
          face global PrimarySelection   ''${fg_alpha},''${blue}+g
          face global SecondarySelection ''${bg_alpha},''${blue}+g
          face global PrimaryCursor      ''${bg},''${fg}+fg
          face global SecondaryCursor    ''${bg},''${bg4}+fg
          face global PrimaryCursorEol   ''${bg},''${fg4}+fg
          face global SecondaryCursorEol ''${bg},''${bg2}+fg
          face global LineNumbers        ''${bg4}
          face global LineNumberCursor   ''${yellow},''${bg1}
          face global LineNumbersWrapped ''${bg1}
          face global MenuForeground     ''${bg2},''${blue}
          face global MenuBackground     ''${fg},''${bg2}
          face global MenuInfo           ''${bg}
          face global Information        ''${bg},''${fg}
          face global Error              ''${bg},''${red}
          face global DiagnosticError    ''${red}
          face global DiagnosticWarning  ''${yellow}
          face global StatusLine         ''${fg},''${bg}
          face global StatusLineMode     ''${yellow}+b
          face global StatusLineInfo     ''${purple}
          face global StatusLineValue    ''${red}
          face global StatusCursor       ''${bg},''${fg}
          face global Prompt             ''${yellow}
          face global MatchingChar       ''${fg},''${bg3}+b
          face global BufferPadding      ''${bg2},''${bg}
          face global Whitespace         ''${bg2}+f
      "
  '';
}
