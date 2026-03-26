{ lib, ... }:
{
  options.gb.home.desktop.mango.mangowc = {
    startupTarget = lib.mkOption {
      type = lib.types.str;
      default = "mango-session.target";
      description = "Systemd user target started by MangoWC autostart.";
    };

    settings.values = lib.mkOption {
      type = lib.types.attrsOf (
        lib.types.oneOf [
          lib.types.bool
          lib.types.int
          lib.types.float
          lib.types.str
        ]
      );
      default = {
        xwayland_persistence = 1;
        focus_on_activate = 1;
        sloppyfocus = 1;
        warpcursor = 1;
        drag_tile_to_tile = 1;
        single_scratchpad = 1;
        cursor_size = 24;
        cursor_theme = "Adwaita";
        gappih = 5;
        gappiv = 5;
        gappoh = 10;
        gappov = 10;
        borderpx = 2;
      };
      description = "Declarative MangoWC `key=value` settings.";
    };

    env = lib.mkOption {
      type = lib.types.attrsOf lib.types.str;
      default = {
        XCURSOR_SIZE = "24";
        XCURSOR_THEME = "Adwaita";
        QT_QPA_PLATFORMTHEME = "qt6ct";
        QT_AUTO_SCREEN_SCALE_FACTOR = "1";
        QT_QPA_PLATFORM = "Wayland;xcb";
      };
      description = "Environment entries rendered as `env=KEY,VALUE`.";
    };

    bindLines = lib.mkOption {
      type = lib.types.listOf lib.types.str;
      default = [
        "bind=SUPER,r,reload_config"
        "bind=SUPER+SHIFT,M,quit"
        "bind=SUPER,Return,spawn,foot"
        "bind=SUPER,E,spawn,nautilus"
        "bind=SUPER,Space,spawn,dms ipc call launcher toggle"
        "bind=SUPER,M,spawn,dms ipc call lock lock"
        "bind=SUPER,Q,killclient"
        "bind=SUPER+SHIFT,F,togglefloating"
        "bind=SUPER,F,togglefullscreen"
        "bind=SUPER+A,togglemaxmizescreen"
        "bind=SUPER+G,toggleglobal"
        "bind=SUPER+O,toggleoverlay"
        "bind=SUPER,I,minimized"
        "bind=SUPER+SHIFT,I,restore_minimized"
        "bind=SUPER,S,toggle_scratchpad"
        "bind=SUPER,V,spawn_shell,cliphist list | wofi --dmenu | cliphist decode | wl-copy"
        "bind=SUPER+SHIFT,V,spawn,cliphist wipe"
        "bind=NONE,Print,spawn_shell,grim -g \"$(slurp -d)\" - | wl-copy"
        "bind=NONE,XF86AudioMute,spawn,dms ipc call audio mute"
        "bind=NONE,XF86AudioRaiseVolume,spawn,dms ipc call audio increment 5"
        "bind=NONE,XF86AudioLowerVolume,spawn,dms ipc call audio decrement 5"
        "bind=NONE,XF86MonBrightnessUp,spawn,dms ipc call brightness increment 5 \"\""
        "bind=NONE,XF86MonBrightnessDown,spawn,dms ipc call brightness decrement 5 \"\""
        "bind=NONE,XF86AudioPlay,spawn,dms ipc call mpris playPause"
        "bind=NONE,XF86AudioNext,spawn,dms ipc call mpris next"
        "bind=NONE,XF86AudioPrev,spawn,dms ipc call mpris previous"
        "bind=SUPER,left,focusdir,left"
        "bind=SUPER,right,focusdir,right"
        "bind=SUPER,up,focusdir,up"
        "bind=SUPER,down,focusdir,down"
        "bind=SUPER,H,focusdir,left"
        "bind=SUPER,L,focusdir,right"
        "bind=SUPER,K,focusdir,up"
        "bind=SUPER,J,focusdir,down"
        "bind=SUPER,Tab,focusstack,next"
        "bind=SUPER+SHIFT,Tab,focusstack,prev"
        "bind=ALT,Tab,toggleoverview"
        "bind=SUPER+SHIFT,left,exchange_client,left"
        "bind=SUPER+SHIFT,right,exchange_client,right"
        "bind=SUPER+SHIFT,up,exchange_client,up"
        "bind=SUPER+SHIFT,down,exchange_client,down"
        "bind=SUPER+SHIFT,H,exchange_client,left"
        "bind=SUPER+SHIFT,L,exchange_client,right"
        "bind=SUPER+SHIFT,K,exchange_client,up"
        "bind=SUPER+SHIFT,J,exchange_client,down"
        "bind=SUPER+CTRL,left,resizewin,-20,+0"
        "bind=SUPER+CTRL,right,resizewin,+20,+0"
        "bind=SUPER+CTRL,up,resizewin,+0,-20"
        "bind=SUPER+CTRL,down,resizewin,+0,+20"
        "bind=SUPER+CTRL,H,resizewin,-20,+0"
        "bind=SUPER+CTRL,L,resizewin,+20,+0"
        "bind=SUPER+CTRL,K,resizewin,+0,-20"
        "bind=SUPER+CTRL,J,resizewin,+0,+20"
        "mousebind=SUPER,btn_left,moveresize,curmove"
        "mousebind=SUPER,btn_right,moveresize,curresize"
        "mousebind=SUPER+CTRL,btn_left,minimized"
        "mousebind=SUPER+CTRL,btn_right,killclient"
        "mousebind=SUPER+CTRL,btn_middle,togglefullscreen"
        "mousebind=ALT,btn_middle,scroller_proportion,0.5"
        "mousebind=NONE,btn_middle,togglemaxmizescreen"
        "mousebind=SUPER,scroll_up,viewleft_have_client"
        "mousebind=SUPER,scroll_down,viewright_have_client"
        "mousebind=ALT,scroll_up,focusdir,left"
        "mousebind=ALT,scroll_down,focusdir,right"
        "mousebind=SUPER+SHIFT,scroll_up,exchange_client,left"
        "mousebind=SUPER+SHIFT,scroll_down,exchange_client,right"
        "gesturebind=none,left,3,viewtoright_have_client"
        "gesturebind=none,right,3,viewtoleft_have_client"
        "gesturebind=none,up,3,toggleoverview"
        "gesturebind=none,down,3,toggleoverview"
        "switchbind=fold,spawn,swaylock -f -c 000000"
        "switchbind=unfold,spawn,wlr-dpms on"
        "bind=SUPER,1,view,1,0"
        "bind=SUPER,2,view,2,0"
        "bind=SUPER,3,view,3,0"
        "bind=SUPER,4,view,4,0"
        "bind=SUPER,5,view,5,0"
        "bind=SUPER,6,view,6,0"
        "bind=SUPER,7,view,7,0"
        "bind=SUPER,8,view,8,0"
        "bind=SUPER,9,view,9,0"
        "bind=SUPER,0,view,10,0"
        "bind=SUPER+SHIFT,1,tag,1,0"
        "bind=SUPER+SHIFT,2,tag,2,0"
        "bind=SUPER+SHIFT,3,tag,3,0"
        "bind=SUPER+SHIFT,4,tag,4,0"
        "bind=SUPER+SHIFT,5,tag,5,0"
        "bind=SUPER+SHIFT,6,tag,6,0"
        "bind=SUPER+SHIFT,7,tag,7,0"
        "bind=SUPER+SHIFT,8,tag,8,0"
        "bind=SUPER+SHIFT,9,tag,9,0"
        "bind=SUPER+SHIFT,0,tag,10,0"
        "bind=SUPER+CTRL,1,toggleview,1,0"
        "bind=SUPER+CTRL,2,toggleview,2,0"
        "bind=SUPER+CTRL,3,toggleview,3,0"
        "bind=SUPER+CTRL,4,toggleview,4,0"
        "bind=SUPER+CTRL,5,toggleview,5,0"
        "bind=SUPER+CTRL,6,toggleview,6,0"
        "bind=SUPER+CTRL,7,toggleview,7,0"
        "bind=SUPER+CTRL,8,toggleview,8,0"
        "bind=SUPER+CTRL,9,toggleview,9,0"
        "bind=SUPER+CTRL,0,toggleview,10,0"
        "bind=SUPER+CTRL+SHIFT,1,toggletag,1,0"
        "bind=SUPER+CTRL+SHIFT,2,toggletag,2,0"
        "bind=SUPER+CTRL+SHIFT,3,toggletag,3,0"
        "bind=SUPER+CTRL+SHIFT,4,toggletag,4,0"
        "bind=SUPER+CTRL+SHIFT,5,toggletag,5,0"
        "bind=SUPER+CTRL+SHIFT,6,toggletag,6,0"
        "bind=SUPER+CTRL+SHIFT,7,toggletag,7,0"
        "bind=SUPER+CTRL+SHIFT,8,toggletag,8,0"
        "bind=SUPER+CTRL+SHIFT,9,toggletag,9,0"
        "bind=SUPER+CTRL+SHIFT,0,toggletag,10,0"
        "bind=SUPER,comma,viewleft_have_client"
        "bind=SUPER,period,viewright_have_client"
        "bind=ALT+CTRL,Left,focusmon,left"
        "bind=ALT+CTRL,Right,focusmon,right"
        "bind=ALT+CTRL,Up,focusmon,up"
        "bind=ALT+CTRL,Down,focusmon,down"
        "bind=ALT+CTRL,H,focusmon,left"
        "bind=ALT+CTRL,L,focusmon,right"
        "bind=ALT+CTRL,K,focusmon,up"
        "bind=ALT+CTRL,J,focusmon,down"
        "bind=ALT+SHIFT,Left,tagmon,left"
        "bind=ALT+SHIFT,Right,tagmon,right"
        "bind=ALT+SHIFT,Up,tagmon,up"
        "bind=ALT+SHIFT,Down,tagmon,down"
        "bind=ALT+SHIFT,H,tagmon,left"
        "bind=ALT+SHIFT,L,tagmon,right"
        "bind=ALT+SHIFT,K,tagmon,up"
        "bind=ALT+SHIFT,J,tagmon,down"
        "bind=SUPER,N,switch_layout"
        "bind=SUPER+ALT,I,setlayout,tile"
        "bind=SUPER+ALT,L,setlayout,scroller"
        "bind=SUPER,X,scroller_next_proportion"
        "bind=SUPER+SHIFT,X,scroller_proportion,1.0"
        "bind=SUPER+CTRL,M,incnmaster,+1"
        "bind=SUPER+CTRL+SHIFT,M,incnmaster,-1"
        "bind=SUPER+ALT,Equal,gaps,+5"
        "bind=SUPER+ALT,Minus,gaps,-5"
        "bind=SUPER+ALT,BackSpace,togglegaps"
      ];
      description = "Raw bind lines rendered into MangoWC config (bind/mousebind/gesturebind/switchbind).";
    };

    monitors = lib.mkOption {
      type = lib.types.listOf lib.types.str;
      default = [ ];
      description = "Monitor rules rendered as `monitorrule=` lines.";
    };

    rules = lib.mkOption {
      type = lib.types.listOf lib.types.str;
      default = [ ];
      description = "Additional raw rules lines.";
    };

    dmsIncludes.enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = "Include DMS-managed snippets under `~/.config/mango/dms/`.";
    };

    dmsIncludes.files = lib.mkOption {
      type = lib.types.listOf lib.types.str;
      default = [
        "colors.conf"
        "outputs.conf"
        "layout.conf"
        "cursor.conf"
        "binds.conf"
      ];
      description = "DMS include files that must exist for MangoWC startup.";
    };

    settings.base = lib.mkOption {
      type = lib.types.lines;
      default = "";
      description = "Raw lines inserted before generated MangoWC sections.";
    };

    settings.extra = lib.mkOption {
      type = lib.types.lines;
      default = "";
      description = "Raw lines appended after generated MangoWC sections.";
    };

    autostart.commands = lib.mkOption {
      type = lib.types.listOf lib.types.str;
      default = [ ];
      description = "Extra shell commands appended to MangoWC autostart script.";
    };

    autostart.extra = lib.mkOption {
      type = lib.types.lines;
      default = "";
      description = "Raw shell lines appended to MangoWC autostart script.";
    };

    packages.enable = lib.mkEnableOption "Install MangoWC companion packages";
    packages.base = lib.mkOption {
      type = lib.types.listOf lib.types.package;
      default = [ ];
      description = "Base package set for MangoWC utilities.";
    };

    packages.laptopExtra = lib.mkOption {
      type = lib.types.listOf lib.types.package;
      default = [ ];
      description = "Extra packages for laptop hosts.";
    };
  };

  config.gb.home.desktop.mango.mangowc.packages.enable = lib.mkDefault true;
}
