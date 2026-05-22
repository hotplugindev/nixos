{ lib, ... }:
{
  imports = [
    (lib.mkAliasOptionModule
      [ "gb" "home" "desktop" "mango" "dms" "program" ]
      [ "programs" "dank-material-shell" ])
  ];
}
