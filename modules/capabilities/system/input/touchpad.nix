{ lib, config, ... }:
let
  requested = config.gb.requires.system.input.touchpad != [ ];
in
{
  config = lib.mkIf requested {
    services.libinput = {
      enable = true;
      touchpad = {
        naturalScrolling = true;
        tapping = true;
      };
    };
  };
}
