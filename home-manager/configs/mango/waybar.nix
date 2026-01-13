{pkgs, ...}:

{
  programs.waybar.enable = true;
  programs.waybar.style = ''
    #workspaces button {
      padding: 0 20px;
      color: #ddca9e;
    }
    /* Active tag (viewed) */
    #workspaces button.active {
      color: #282828;
      background-color: #ddca9e;
    }
    /* Tag with windows but not focused */
    #workspaces button.occupied {
      color: #cdc885;
    }
    /* Tag requesting attention */
    #workspaces button.urgent {
      background-color: #ef5e5e;
      color: #282828;
    }
  '';

  programs.waybar.settings = {
    mainBar = {
      height = 200;
      modules-left = [ "ext/workspaces" "dwl/window" ];
      "ext/workspaces" = {
        format = "{icon}";
        ignore-hidden = true;
        on-click = "activate";
        on-click-right = "deactivate";
        sort-by-id = true;
      };
      "dwl/window" = {
        format = "      [{layout}] {title}";
      };
    };
  };

}
