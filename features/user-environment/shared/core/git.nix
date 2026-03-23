{ ... }:
let
  me = (import ../../../../users).hotplugin;
in
{
  programs.git = {
    enable = true;
    settings = {
      user.name = me.fullName;
      user.email = me.email;
      
      init.defaultBranch = "main";
      pull.rebase = false;
      credential.helper = "store";
    };
  };
}
