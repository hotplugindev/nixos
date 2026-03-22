{ inputs, pkgs, lib, hostType, ... }:
{
  imports = [ inputs.mango.hmModules.mango ];

  wayland.windowManager.mango = {
    enable = true;
    settings = builtins.readFile ../../../../assets/desktop/mango/shared/config.conf;
    autostart_sh = builtins.readFile ../../../../assets/desktop/mango/autostart.sh;
  };

systemd.user.services.polkit-gnome-authentication-agent-1 = {
  Unit = {
    Description = "polkit-gnome-authentication-agent-1";
    Wants = [ "graphical-session.target" ];
    After = [ "graphical-session.target" ];
  };
  Install = {
    WantedBy = [ "graphical-session.target" ];
  };
  Service = {
    Type = "simple";
    ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
    Restart = "on-failure";
    RestartSec = 1;
    TimeoutStopSec = 10;
  };
};

  home.packages = with pkgs; [
    foot
    grim
    slurp
    brightnessctl
    pamixer
    playerctl
    nautilus
    wofi
    swaylock
    qt6Packages.qt6ct
    wlogout
    polkit_gnome
    swaynotificationcenter
    sox
  ] ++ lib.optionals (hostType == "laptop") [ wlr-randr ];

  xdg.configFile."mango/config.conf".source = ../../../../assets/desktop/mango/shared/config.conf;
  xdg.configFile."mango/bind.conf".source = ../../../../assets/desktop/mango/shared/bind.conf;
  xdg.configFile."mango/env.conf".source = ../../../../assets/desktop/mango/shared/env.conf;
  xdg.configFile."mango/rule.conf".source = ../../../../assets/desktop/mango/shared/rule.conf;
  xdg.configFile."mango/tag.conf".source = ../../../../assets/desktop/mango/shared/tag.conf;
}
