{ lib, config, ... }:
let
  nix-command = config.gb.nix.nix-command;
in
{
  options = {
    gb.nix.nix-command.enable = lib.mkEnableOption "Enable nix-command for the system";
  };

  config = lib.mkIf nix-command.enable {
    nix.settings.experimental-features = [
      "nix-command"
    ];
  };
}
