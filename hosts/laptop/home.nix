{
  gb.home.programs.gaming.steampack.enable = true;
  gb.home.programs.gaming.bottles.enable = true;
  gb.home.programs.gaming.ckan.enable = true;

  gb.home.terminal.foot.fontSize = "8";

  gb.home.programs.ai.qwen-code.enable = true;

  gb.home.programs.remote.tigervnc.enable = true;
  gb.home.programs.remote.moonlight-qt.enable = true;

  gb.home.dev.languages.flutter.enable = true;
  gb.home.dev.languages.dotnet.enable = true;
  gb.home.dev.languages.go.enable = true;

  gb.home.dev.editors.android-studio.enable = true;
  gb.home.dev.editors.antigravity.enable = true;
  gb.home.dev.editors.arduino-ide.enable = true;
  gb.home.dev.editors.jetbrains-rider.enable = true;

  gb.home.desktop.mango.mangowc.settings.values = {
    trackpad_natural_scrolling = 1;
    tap_to_click = 1;
    disable_while_typing = 1;
  };

  gb.home.desktop.mango.mangowc.monitors = [
    "name:eDP-1,width:2256,height:1504,refresh:60,x:0,y:10,scale:1.333,vrr:0,rr:0"
  ];

  gb.home.dev.languages.php.enable = true;

  gb.home.dev.languages.python.libraries = ps: [
    ps.pytest
    ps.tkinter
    ps.requests
  ];
}
