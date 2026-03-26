{
  lib,
  config,
  ...
}:
let
  mango = config.gb.home.desktop.mango;
in
{
  config = lib.mkIf (mango.enable && mango.dms.enable) {

    programs.dank-material-shell = {
      enable = lib.mkDefault true;

      enableSystemMonitoring = lib.mkDefault true;
      enableVPN = lib.mkDefault true;
      enableDynamicTheming = lib.mkDefault true;
      enableAudioWavelength = lib.mkDefault true;
      enableCalendarEvents = lib.mkDefault false;
      enableClipboardPaste = lib.mkDefault true;

      settings = {
        currentThemeName = "dynamic";
        currentThemeCategory = "dynamic";
        matugenScheme = "scheme-content";

        controlCenterWidgets = [
          {
            id = "volumeSlider";
            enabled = true;
            width = 50;
          }
          {
            id = "brightnessSlider";
            enabled = true;
            width = 50;
          }
          {
            id = "wifi";
            enabled = true;
            width = 50;
          }
          {
            id = "bluetooth";
            enabled = true;
            width = 50;
          }
          {
            id = "audioOutput";
            enabled = true;
            width = 50;
          }
          {
            id = "audioInput";
            enabled = true;
            width = 50;
          }
          {
            id = "nightMode";
            enabled = true;
            width = 50;
          }
          {
            id = "darkMode";
            enabled = true;
            width = 50;
          }
          {
            id = "builtin_vpn";
            enabled = true;
            width = 50;
          }
          {
            id = "colorPicker";
            enabled = true;
            width = 50;
          }
        ];
      };
      session = {
        weatherLocation = lib.mkDefault "Brixen - Bressanone, 39042";
        weatherCoordinates = "46.7164130,11.6577920";
      };
    };
  };
}
