{ lib, ... }:
{
  options.gb.home.desktop.mango.dms.includes = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = "Source DMS-managed MangoWC snippets from `~/.config/mango/dms/`.";
    };

    files = lib.mkOption {
      type = lib.types.listOf lib.types.str;
      default = [
        "colors.conf"
        "outputs.conf"
        "layout.conf"
        "cursor.conf"
        "binds.conf"
      ];
      description = "DMS snippet filenames bootstrapped and sourced into MangoWC.";
    };
  };
}
