{
  lib,
  config,
  pkgs,
  ...
}:
let
  aider-chat = config.gb.home.programs.ai.aider-chat;
in
{
  options = {
    gb.home.programs.ai.aider-chat.enable = lib.mkEnableOption "Enable aider-chat agent";
  };

  config = lib.mkIf aider-chat.enable {
    home.packages = [
      pkgs.aider-chat
    ];
  };
}
