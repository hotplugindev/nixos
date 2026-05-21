{ lib, config, ... }:
let
  requested = config.gb.requires.home.git != [ ];
in
{
  config = lib.mkIf requested {
    programs.git = {
      enable = true;
      settings = {
        user.name = config.gb.user.fullName;
        user.email = config.gb.user.email;
        init.defaultBranch = "main";
        pull.rebase = false;
        credential.helper = "store";
      };
    };
  };
}
