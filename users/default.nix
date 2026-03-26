let
  mkHome =
    { username, ... }:
    {
      imports = [ ../home/default.nix ];
      home.username = username;
      home.homeDirectory = "/home/${username}";
    };
in
{
  hotplugin = {
    username = "hotplugin";
    fullName = "Giona Berti";
    email = "giona7berti@gmail.com";
    isMain = true;
    homeConfig = mkHome;
  };
}
