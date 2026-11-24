{
  lib,
  config,
  ...
}:
let
  umbriel = config.gb.home.desktop.umbriel;
  cfg = umbriel.umbriel;
in
{
  config = lib.mkIf (umbriel.enable && cfg.enable) {
    programs.umbriel.enable = true;
  };
}
