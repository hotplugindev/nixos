{
  lib,
  config,
  fullName,
  email,
  ...
}:
let
  git = config.gb.home.dev.tooling.git;
in
{
  options = {
    gb.home.dev.tooling.git.enable = lib.mkEnableOption "Enable git in the home dir";
  };

  config = lib.mkIf git.enable {
    programs.git = {
      enable = true;
      settings = {
        user.name = fullName;
        user.email = email;

        init.defaultBranch = "main";
        pull.rebase = false;
        credential.helper = "store";
      };
    };
  };
}
