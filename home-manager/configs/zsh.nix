{pkgs, user, ...}:

{
  programs.zsh = {
    enable = true;
    plugins = [
      {
        name = "zsh-helix-mode";
        src  = pkgs.zsh-helix-mode;
        file = "share/zsh-helix-mode/zsh-helix-mode.plugin.zsh";
      }
    ];
    enableCompletion = true;
    autosuggestion.enable = true;

    initContent = ''
      ZSH_AUTOSUGGEST_CLEAR_WIDGETS+=(
        zhm_history_prev
        zhm_history_next
        zhm_prompt_accept
        zhm_accept
        zhm_accept_or_insert_newline
      )
      ZSH_AUTOSUGGEST_ACCEPT_WIDGETS+=(
        zhm_move_right
        zhm_clear_selection_move_right
        zhm_goto_line_end
      )
      ZSH_AUTOSUGGEST_PARTIAL_ACCEPT_WIDGETS+=(
        zhm_move_next_word_start
        zhm_move_next_word_end
      )

      ZSH_AUTOSUGGEST_STRATEGY=(history completion)
      setopt prompt_subst

      PROMPT=$'%F{130}%~%f %F{14}%f%F{128}%F{197}> %f'

      # PROMPT=$'\n%F{130}%~%f %F{14}$(git branch 2>/dev/null | sed -e "/^[^*]/d" -e "s/* \(.*\)/(\1)/")%f\n\n%F{128}--%F{197}>%f'
    '';
  };
}
