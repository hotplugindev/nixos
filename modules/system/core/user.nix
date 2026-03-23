{
  pkgs,
  fullName,
  username,
  ...
}:
{
  users.users.${username} = {
    isNormalUser = true;
    description = fullName;
    extraGroups = [
      "wheel"
      "networkmanager"
      "video"
      "audio"
      "input"

      #docker
      "docker"
    ];
    shell = pkgs.zsh;
  };

  programs.zsh.enable = true;
}
