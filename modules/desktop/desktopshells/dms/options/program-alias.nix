{ lib, ... }:
{
  imports = [
    (lib.mkAliasOptionModule
      [ "gb" "home" "desktopshells" "dms" "program" ]
      [ "programs" "dank-material-shell" ]
    )
  ];
}
