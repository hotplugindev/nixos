{ lib, config, ... }:
let
  time = config.gb.system.locales.time;
in
{
  options = {
    gb.system.locales.time = lib.mkOption {
      type = lib.types.str;
      default = "Europe/Rome";
      description = "Timezone to be used";
    };
  };

  config = {
    time.timeZone = config.gb.system.locales.time;
  };
}
