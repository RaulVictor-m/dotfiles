{pkgs, home-manager, ...}:

{
  home.file.".config/mango/config.conf".text = ''
    # AUTOSTART
        exec-once=hypridle
        exec-once=waybar
        exec-once=swaybg -i ~/dotfiles/home-manager/configs/wallpaper.jpg

    # CONFIG
        drag_tile_to_tile          = 1
        idleinhibit_ignore_visible = 1
        monitorrule                = HDMI-A-1,0.8,1,scroller,0,1,0,0,1920,1080,60
        adaptive_sync              = 1
        syncobj_enable             = 1
        allow_tearing              = 0
        animations                 = 1
        layer_animations           = 1
        animation_fade_in          = 0
        animation_fade_out         = 0
        animation_type_close       = none
        animation_duration_move    = 200
        animation_duration_open    = 200
        animation_duration_tag     = 200
        animation_duration_close   = 200
        animation_duration_focus   = 200

    # VISUAL
        gappov = 35
        gappoh = 35

    # LAYOUT: SCROLLER
        scroller_structs                   = 35
        scroller_proportion_preset         = 0.9,0.5
        scroller_default_proportion        = 0.9
        scroller_focus_center              = 0
        scroller_prefer_center             = 0
        edge_scroller_pointer_focus        = 1
        scroller_ignore_proportion_single  = 0
        scroller_default_proportion_single = 1.0

    # BIND: TOOLS AND CONTROL
        bind=SUPER,d,spawn,wmenu-run -f 20
        bind=SUPER,b,spawn,killall -s SIGUSR1 -r waybar

        bind=SUPER+SHIFT,Return,spawn,alacritty
        bind=SUPER+SHIFT,q,killclient
        bind=SUPER+SHIFT,c,quit
        bind=SUPER+SHIFT,r,reload_config

    # BIND: RESIZE
        bind=SUPER,h,resizewin,-50,0
        bind=SUPER,l,resizewin,+50,0
        bind=SUPER,space,switch_proportion_preset


    # BIND: NAVIGATIONS

        bind=SUPER,o,toggleoverview
        bind=SUPER,j,focusstack,next
        bind=SUPER,k,focusstack,prev
        bind=SUPER+SHIFT,j,exchange_stack_client,next
        bind=SUPER+SHIFT,k,exchange_stack_client,prev

        bind=SUPER+SHIFT,f,togglefloating
        bind=SUPER,Return,zoom

        bind=SUPER,s,setlayout,scroller
        bind=SUPER,v,setlayout,vertical_scroller
        bind=SUPER,t,setlayout,tile
        bind=SUPER,m,setlayout,monocle

    # BIND: TAGS
        bind=SUPER,1,view,1
        bind=SUPER,2,view,2
        bind=SUPER,3,view,3
        bind=SUPER,4,view,4
        bind=SUPER,5,view,5
        bind=SUPER,6,view,6
        bind=SUPER,7,view,7
        bind=SUPER,8,view,8
        bind=SUPER,9,view,9
        bind=SUPER,0,view,1|2|3|4|5|6|7|8|9

        bind=SUPER+SHIFT,1,tag,1
        bind=SUPER+SHIFT,2,tag,2
        bind=SUPER+SHIFT,3,tag,3
        bind=SUPER+SHIFT,4,tag,4
        bind=SUPER+SHIFT,5,tag,5
        bind=SUPER+SHIFT,6,tag,6
        bind=SUPER+SHIFT,7,tag,7
        bind=SUPER+SHIFT,8,tag,8
        bind=SUPER+SHIFT,9,tag,9

        bind=SUPER+CTRL,1,toggleview,1
        bind=SUPER+CTRL,2,toggleview,2
        bind=SUPER+CTRL,3,toggleview,3
        bind=SUPER+CTRL,4,toggleview,4
        bind=SUPER+CTRL,5,toggleview,5
        bind=SUPER+CTRL,6,toggleview,6
        bind=SUPER+CTRL,7,toggleview,7
        bind=SUPER+CTRL,8,toggleview,8
        bind=SUPER+CTRL,9,toggleview,9

        bind=SUPER+CTRL+SHIFT,1,toggletag,1
        bind=SUPER+CTRL+SHIFT,2,toggletag,2
        bind=SUPER+CTRL+SHIFT,3,toggletag,3
        bind=SUPER+CTRL+SHIFT,4,toggletag,4
        bind=SUPER+CTRL+SHIFT,5,toggletag,5
        bind=SUPER+CTRL+SHIFT,6,toggletag,6
        bind=SUPER+CTRL+SHIFT,7,toggletag,7
        bind=SUPER+CTRL+SHIFT,8,toggletag,8
        bind=SUPER+CTRL+SHIFT,9,toggletag,9
        bind=SUPER+CTRL+SHIFT,0,toggletag,0

    # MOUSE
        mousebind=SUPER,btn_left,moveresize,curmove
        mousebind=SUPER,btn_right,moveresize,curresize
  '';

  home.file.".config/hypr/hypridle.conf".text = ''
    listener {
      timeout = 300
      on-timeout = wlr-randr --output HDMI-A-1 --off
      on-resume = wlr-randr --output HDMI-A-1 --on
    }

    listener {
      timeout = 900
      on-timeout = systemctl suspend
    }
  '';

}
