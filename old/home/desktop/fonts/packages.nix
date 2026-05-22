{
  lib,
  config,
  pkgs,
  ...
}:
let
  fonts = config.gb.home.desktop.fonts;
in
{
  options = {
    gb.home.desktop.fonts = {
      packages = lib.mkOption {
        type = lib.types.listOf lib.types.package;
        default = with pkgs; [
          noto-fonts-color-emoji
          jetbrains-mono
          nerd-fonts.jetbrains-mono
          nerd-fonts.symbols-only
          font-awesome
        ];
        description = "Font packages installed for desktop sessions";
      };
    };
  };

  config = lib.mkIf fonts.enable {
    home.packages = fonts.packages;
  };
}
