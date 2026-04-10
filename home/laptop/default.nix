{ lib, ... }:
{
  imports = [
  ];

  gb.home.programs.gaming.steampack.enable = true;
  gb.home.programs.gaming.ckan.enable = true;

  gb.home.desktop.terminals.foot.fontSize = "8";

  gb.home.programs.ai.codex.enable = true;

  gb.home.programs.remote.tigervnc.enable = true;

  gb.home.desktop.mango.mangowc.settings.values = {
    trackpad_natural_scrolling = 1;
    tap_to_click = 1;
    disable_while_typing = 1;
  };

  gb.home.desktop.mango.mangowc.monitors = [
    "name:eDP-1,width:2256,height:1504,refresh:60,x:0,y:10,scale:1.333,vrr:0,rr:0"
  ];

  gb.home.dev.languages.python.libraries = ps: [ ps.pytest ];
}
