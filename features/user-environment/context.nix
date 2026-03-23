{ ... }:
let
  me = (import ../../users).hotplugin;
in
{
  home.username = me.username;
  home.homeDirectory = "/home/${me.username}";
}
