{
  lib,
  config,
  pkgs,
  ...
}:
let
  jetbrains-idea = config.gb.home.dev.editors.jetbrains-idea;
in
{
  options = {
    gb.home.dev.editors.jetbrains-idea.enable = lib.mkEnableOption "Enable JetBrains IntelliJ Idea";
  };

  config = lib.mkIf jetbrains-idea.enable {
    home.packages = [
      pkgs.jetbrains.idea
    ];
  };
}
