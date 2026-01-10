{ config, pkgs, user, ... }:

{
  networking.interfaces.enp5s0.wakeOnLan.enable = true;
  programs.xwayland.enable = true;

  services.displayManager.ly.enable = true;
  services.displayManager.ly.settings = {
    allow_empty_password = false;
    auth_fails = 5;
    bg = "0x00696969";
    full_color = true;
    inactivity_cmd = "systemctl suspand";
    inactivity_delay = 900;

    vi_mode = true;
    vi_default_mode = "insert";

    save = true;
    animation = "gameoflife";
    gameoflife_fg = "0x00FF0000";
    gameoflife_frame_delay = 15;
  };
  services.displayManager.ly.x11Support = true;

}
