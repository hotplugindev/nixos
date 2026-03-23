{ pkgs, ... }:
{
  systemd.user.services.swaybg = {
    Unit = {
      Description = "Wallpaper (Mango)";
      PartOf = [ "mango-session.target" ];
      After = [
        "mango-session.target"
        "dbus-env.service"
      ];
    };

    Service = {
      ExecStart = "${pkgs.swaybg}/bin/swaybg -i %h/.config/wallpaper/wallpaper.png -m fill";
      Restart = "on-failure";
    };

    Install = {
      WantedBy = [ "mango-session.target" ];
    };
  };
}
