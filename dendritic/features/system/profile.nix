{ hostType, ... }:
{
  imports =
    if hostType == "laptop" then
      [ ../../../modules/system/profiles/laptop.nix ]
    else
      [ ../../../modules/system/profiles/desktop.nix ];
}
