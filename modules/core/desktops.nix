{
  mango = {
    sessionCommand =
      shell:
      "${shell} -l -c mango"
    ;
    sessionTarget = "mango-session.target";
    customSessionTarget = true;
    systemRequests = [
      "greetd"
      "xdgPortal"
      "xwayland"
      "gnomeKeyring"
      "dconf"
    ];
    homeRequests = [
      "sessionTarget"
      "authAgent"
      "dbusEnv"
      "cliphist"
      "nextcloud"
    ];
    deferred = false;
  };

  sway = {
    sessionCommand =
      shell:
      "${shell} -l -c sway"
    ;
    sessionTarget = "sway-session.target";
    customSessionTarget = false;
    systemRequests = [
      "greetd"
      "xdgPortal"
      "xwayland"
      "gnomeKeyring"
      "dconf"
    ];
    homeRequests = [
      "sessionTarget"
      "authAgent"
      "dbusEnv"
      "cliphist"
      "nextcloud"
    ];
    deferred = false;
  };

  hyprland = {
    sessionCommand =
      shell:
      "${shell} -l -c start-hyprland"
    ;
    sessionTarget = "hyprland-session.target";
    customSessionTarget = false;
    systemRequests = [
      "greetd"
      "xwayland"
      "gnomeKeyring"
      "dconf"
    ];
    homeRequests = [
      "sessionTarget"
      "authAgent"
      "dbusEnv"
      "cliphist"
      "nextcloud"
    ];
    deferred = false;
  };

  gnome = {
    sessionCommand =
      shell:
      "${shell} -l -c gnome-session"
    ;
    sessionTarget = "graphical-session.target";
    customSessionTarget = false;
    systemRequests = [ ];
    homeRequests = [ ];
    deferred = true;
  };

  kde = {
    sessionCommand =
      shell:
      "${shell} -l -c startplasma-wayland"
    ;
    sessionTarget = "graphical-session.target";
    customSessionTarget = false;
    systemRequests = [ ];
    homeRequests = [ ];
    deferred = true;
  };
}
