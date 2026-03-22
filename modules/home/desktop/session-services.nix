{ pkgs, ... }:

{
  home.packages = with pkgs; [
    nextcloud-client
    waybar
    swaybg
    wl-clipboard
    cliphist
    networkmanagerapplet
  ];

  ##################################
  # DBUS ENVIRONMENT (oneshot)
  ##################################
  systemd.user.services.dbus-env = {
    Unit = {
      Description = "Import Wayland env into systemd user session";
      PartOf = [ "mango-session.target" ];
      After = [ "mango-session.target" ];
    };

    Service = {
      Type = "oneshot";
      ExecStart = ''
        ${pkgs.dbus}/bin/dbus-update-activation-environment --systemd \
          WAYLAND_DISPLAY XDG_CURRENT_DESKTOP XDG_DATA_DIRS GTK_THEME
      '';
      RemainAfterExit = true;
    };

    Install = {
      WantedBy = [ "mango-session.target" ];
    };
  };

  ##################################
  # WAYBAR
  ##################################
  systemd.user.services.waybar = {
    Unit = {
      Description = "Waybar (Mango)";
      PartOf = [ "mango-session.target" ];
      After = [ "mango-session.target" "dbus-env.service" ];
    };

    Service = {
      ExecStart = "${pkgs.waybar}/bin/waybar";
      Restart = "on-failure";
      RestartSec = 2;
    };

    Install = {
      WantedBy = [ "mango-session.target" ];
    };
  };

  ##################################
  # NEXTCLOUD
  ##################################
  systemd.user.services.nextcloud = {
    Unit = {
      Description = "Nextcloud (Mango)";
      PartOf = [ "mango-session.target" ];
      After = [ "mango-session.target" "dbus-env.service" ];
    };

    Service = {
      ExecStart = "${pkgs.nextcloud-client}/bin/nextcloud --background";
      Restart = "on-failure";
      RestartSec = 3;
    };

    Install = {
      WantedBy = [ "mango-session.target" ];
    };
  };

  ##################################
  # SWAYBG
  ##################################
  systemd.user.services.swaybg = {
    Unit = {
      Description = "Wallpaper (Mango)";
      PartOf = [ "mango-session.target" ];
      After = [ "mango-session.target" "dbus-env.service" ];
    };

    Service = {
      ExecStart = "${pkgs.swaybg}/bin/swaybg -i %h/.config/wallpaper/wallpaper.png -m fill";
      Restart = "on-failure";
    };

    Install = {
      WantedBy = [ "mango-session.target" ];
    };
  };

  ##################################
  # NM-APPLET
  ##################################
  systemd.user.services.nm-applet = {
    Unit = {
      Description = "NetworkManager Applet (Mango)";
      PartOf = [ "mango-session.target" ];
      After = [ "mango-session.target" "dbus-env.service" ];
    };

    Service = {
      ExecStart = "${pkgs.networkmanagerapplet}/bin/nm-applet --indicator";
      Restart = "on-failure";
    };

    Install = {
      WantedBy = [ "mango-session.target" ];
    };
  };

  ##################################
  # CLIPHIST (TEXT)
  ##################################
  systemd.user.services.cliphist-text = {
    Unit = {
      Description = "Clipboard history (text)";
      PartOf = [ "mango-session.target" ];
      After = [ "mango-session.target" "dbus-env.service" ];
    };

    Service = {
      ExecStart = "${pkgs.wl-clipboard}/bin/wl-paste --type text --watch ${pkgs.cliphist}/bin/cliphist store";
      Restart = "always";
      RestartSec = 2;
    };

    Install = {
      WantedBy = [ "mango-session.target" ];
    };
  };

  ##################################
  # CLIPHIST (IMAGE)
  ##################################
  systemd.user.services.cliphist-image = {
    Unit = {
      Description = "Clipboard history (image)";
      PartOf = [ "mango-session.target" ];
      After = [ "mango-session.target" "dbus-env.service" ];
    };

    Service = {
      ExecStart = "${pkgs.wl-clipboard}/bin/wl-paste --type image --watch ${pkgs.cliphist}/bin/cliphist store";
      Restart = "always";
      RestartSec = 2;
    };

    Install = {
      WantedBy = [ "mango-session.target" ];
    };
  };

  ##################################
  # SWAYNC
  ##################################

  systemd.user.services.swaync = {
    Unit = {
      Description = "Sway Notification Center";
      PartOf = [ "mango-session.target" ];
      After = [ "mango-session.target" ];
    };

    Install = {
      WantedBy = [ "mango-session.target" ];
    };

    Service = {
      Type = "simple";
      ExecStart = "${pkgs.swaynotificationcenter}/bin/swaync";
      Restart = "on-failure";
      RestartSec = 1;
      TimeoutStopSec = 10;
      Environment = [
        "PATH=/run/current-system/sw/bin:/etc/profiles/per-user/%u/bin"
      ];
    };
  };
}