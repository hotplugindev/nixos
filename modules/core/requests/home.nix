{ lib, ... }:
let
  listOption = description: lib.mkOption {
    type = lib.types.listOf lib.types.str;
    default = [ ];
    inherit description;
  };
in
{
  options.gb.requires.home = {
    git = listOption "Request git configuration";
    shell = listOption "Request shell configuration";
    terminal = listOption "Request terminal configuration";
    theme = listOption "Request theme configuration";
    xdg = listOption "Request xdg configuration";
  };
}
