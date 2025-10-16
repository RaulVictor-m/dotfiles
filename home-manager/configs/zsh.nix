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

      git_prompt() {
        local branch
        branch=$(git symbolic-ref --short HEAD 2>/dev/null)
        [[ -n $branch ]] && echo "($branch)"
      }
      setopt prompt_subst
      PROMPT=$'\n%F{130}%~%f %F{14}$(git branch 2>/dev/null | sed -e "/^[^*]/d" -e "s/* \(.*\)/(\1)/")%f\n\n%F{128}--%F{197}>%f'
    '';
  };
}
