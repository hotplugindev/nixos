{ lib, config, ... }:
let
  locale = config.gb.system.locales.locale;
  layout = config.gb.system.locales.layout;
in
{
  options = {
    gb.system.locales.locale = lib.mkOption {
      type = lib.types.str;
      default = "en_US.UTF-8";
      description = "System locale to be set";
    };
    gb.system.locales.layout = lib.mkOption {
      type = lib.types.str;
      default = "us";
      description = "System keyboard layout to be set set";
    };
  };

  config = {
    i18n.defaultLocale = locale;
    console.keyMap = layout;
  };
}
