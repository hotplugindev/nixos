{ fullName, email, ... }:
{
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
}
