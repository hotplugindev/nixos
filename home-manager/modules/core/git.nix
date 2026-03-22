{ pkgs, ... }:
{
  programs.git = {
    enable = true;
    settings = {
      user.name = "Giona Berti";
      user.email = "giona7berti@gmail.com";
      
      init.defaultBranch = "main";
      pull.rebase = false;
      credential.helper = "store";
    };
  };
}
