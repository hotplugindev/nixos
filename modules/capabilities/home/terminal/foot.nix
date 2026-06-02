{ lib, config, ... }:
let
  requested = config.gb.requires.home.terminal != [ ];
  foot = config.gb.home.terminal.foot;
in
{
  options.gb.home.terminal.foot.fontSize = lib.mkOption {
    type = lib.types.str;
    default = "12";
    description = "Font size for foot";
  };

  config = lib.mkIf requested {
    programs.foot = {
      enable = true;
      server.enable = true;
      settings = {
        main = {
          font = "JetBrains Mono:size=${foot.fontSize}:style=Medium:antialias=true:autohint=true, monospace:size=12";
          dpi-aware = "yes";
          initial-window-size-pixels = "1920x1080";
          selection-target = "clipboard";
          term = "foot";
        };

        environment = {
          TIMG_PIXELATION = "sixel";
          TERM = "foot";
        };

        scrollback = {
          lines = 999999;
        };

        url = {
          launch = "xdg-open \${url}";
          label-letters = "jklsdfgheiunaowcmp";
          osc8-underline = "url-mode";
          regex = "(([a-z][[:alnum:]-]+:(/{1,3}|[a-z0-9%])|www[:digit:]{0,3}[.])([^[:space:](){}<>]+|\\(([^[:space:](){}<>]+|(\\([^[:space:](){}<>]+\\)))*\\)|\\[([^]\\[[:space:](){}<>]+|(\\[[^]\\[[:space:](){}<>]+\\]))*\\])+(\\(([^[:space:](){}<>]+|(\\([^[:space:](){}<>]+\\)))*\\)|\\[([^]\\[[:space:](){}<>]+|(\\[[^]\\[[:space:](){}<>]+\\]))*\\]|[^]\\[[:space:]`!(){};:'\".,<>?«»“”‘’]))";
        };

        "regex:data" = {
          regex = "((([~]{0,1}(/[^/\\0]+)+)/[^\\^  ]+)|([a-fA-f0-9]{7,128})|(ghp_[0-9a-zA-Z]{36})|([0-9]{4,})|([0-9a-f]{7,40})|(core-[0-9A-Za-z]+-[0-9A-Za-z]+-[0-9A-Za-z]+)|(0x[0-9a-fA-F]+)|([0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3})|([A-f0-9:]+:+[A-f0-9:]+[A-f0-9]+)|([a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+.[a-zA-Z]{2,})|([a-z][[:alnum:]-]+:(/{1,3}|[a-z0-9%])|www[:digit:]{0,3}[.])([^[:space:](){}<>]+|\\(([^[:space:](){}<>]+|(\\([^[:space:](){}<>]+\\)))*\\)|\\[([^]\\[[:space:](){}<>]+|(\\[[^]\\[[:space:](){}<>]+\\]))*\\])+(\\(([^[:space:](){}<>]+|(\\([^[:space:](){}<>]+\\)))*\\)|\\[([^]\\[[:space:](){}<>]+|(\\[[^]\\[[:space:](){}<>]+\\]))*\\]|[^]\\[[:space:]`!(){};:'\".,<>?«»“”‘’]))";
        };

        cursor = {
          style = "block";
        };

        mouse = {
          hide-when-typing = "no";
        };

        colors-dark = {
          alpha = 0.7;
          foreground = "D1B88E";
          background = "201b14";
          regular0 = "262626";
          regular1 = "cc0000";
          regular2 = "42B63F";
          regular3 = "DD9400";
          regular4 = "DD9400";
          regular5 = "bf78cf";
          regular6 = "74cd45";
          regular7 = "D1B88E";
          bright0 = "a79e67";
          bright1 = "ef2929";
          bright2 = "8ae234";
          bright3 = "ead96b";
          bright4 = "729fcf";
          bright5 = "ad7fa8";
          bright6 = "ead96b";
          bright7 = "eeeeec";
        };

        "key-bindings" = {
          regex-copy = "[data] Control+Shift+o";
          show-urls-launch = "Control+Shift+j";
        };

        "mouse-bindings" = {
          clipboard-paste = "BTN_RIGHT";
          select-extend = "BTN_LEFT-5";
        };
      };
    };
  };
}
