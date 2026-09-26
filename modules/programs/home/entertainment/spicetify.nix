{
  lib,
  inputs,
  config,
  pkgs,
  ...
}:
let
  spicetify = config.gb.home.programs.multimedia.spicetify;
  spicePkgs = inputs.spicetify.legacyPackages.${pkgs.system};
in
{
  options = {
    gb.home.programs.multimedia.spicetify.enable =
      lib.mkEnableOption "Enable spicetify (spotify wrapper which removes ads and adds themes. Installs Spotify automatically)";
  };

  config = lib.mkIf spicetify.enable {
    gb.home.programs.multimedia.spotify.enable = false;
    programs.spicetify = {
      enable = true;
      enabledExtensions = with spicePkgs.extensions; [
        adblockify
        hidePodcasts
        shuffle
      ];
      theme = spicePkgs.themes.sleek;
      colorScheme = "mocha";
    };
  };
}
