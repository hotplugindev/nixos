{
  lib,
  config,
  ...
}:
let
  noctalia = config.gb.home.desktopshells.noctalia;
  umbriel = config.gb.home.desktop.umbriel;
  umbrielEnabled = umbriel.enable && umbriel.umbriel.enable;
in
{
  options.gb.home.desktopshells.noctalia.compositors.umbriel = {
    enable = lib.mkEnableOption "Enable Noctalia Umbriel compositor integration";
  };

  config = lib.mkMerge [
    {
      gb.home.desktopshells.noctalia.compositors.umbriel.enable = lib.mkDefault (noctalia.enable && umbrielEnabled);
    }

    (lib.mkIf (noctalia.enable && noctalia.compositors.umbriel.enable) {
      gb.home.desktopshells.noctalia.service.target = lib.mkDefault umbriel.umbriel.startupTarget;

      gb.home.desktopshells.noctalia.config.shell.panel = {
        transparency_mode = lib.mkDefault "glass";
        shadow = lib.mkDefault true;
      };

      gb.home.desktopshells.noctalia.config.backdrop = {
        enabled = lib.mkDefault true;
        blur_intensity = lib.mkDefault 0.55;
        tint_intensity = lib.mkDefault 0.3;
      };

      gb.home.desktopshells.noctalia.config.lockscreen = {
        blurred_desktop = lib.mkDefault true;
        blur_intensity = lib.mkDefault 0.7;
      };

      gb.home.desktopshells.noctalia.config.theme = {
        mode = lib.mkDefault "dark";
        pure_black_dark = lib.mkDefault false;
      };
    })
  ];
}
