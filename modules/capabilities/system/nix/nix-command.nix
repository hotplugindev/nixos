{ lib, config, ... }:
let
  nixCommand = config.gb.nix.nix-command;
in
{
  options.gb.nix.nix-command.enable = lib.mkEnableOption "Enable nix-command for the system";

  config = lib.mkIf nixCommand.enable {
    nix.settings.experimental-features = [ "nix-command" ];
  };
}
