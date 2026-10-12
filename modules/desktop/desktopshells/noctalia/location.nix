{
  lib,
  config,
  ...
}:
let
  noctalia = config.gb.home.desktopshells.noctalia;
in
{
  config = lib.mkIf noctalia.enable {
    gb.home.desktopshells.noctalia.config.location.address = lib.mkDefault "Darmstadt, Germany";
    gb.home.desktopshells.noctalia.config.weather.enabled = lib.mkDefault true;
    gb.home.desktopshells.noctalia.config.weather.unit = lib.mkDefault "metric";
    gb.home.desktopshells.noctalia.config.shell.show_location = lib.mkDefault true;
  };
}
