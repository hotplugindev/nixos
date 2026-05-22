{
  lib,
  config,
  pkgs,
  ...
}:
let
  wine = config.gb.programs.wine;
in
{
  options = {
    gb.programs.wine.enable = lib.mkEnableOption "Install Wine and its needed dependencies";
  };

  config = lib.mkIf wine.enable {
    environment.systemPackages = with pkgs; [
      wineWowPackages.stagingFull
      winetricks

      gnutls
      krb5
      samba
      glibcLocales

      # Fonts commonly needed by Windows apps
      fontconfig
      freetype
      corefonts
      liberation_ttf
      dejavu_fonts
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-color-emoji
    ];

  };
}
