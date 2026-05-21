{ lib, users, ... }:
{
  users.users = lib.mapAttrs (_username: details: {
    isNormalUser = true;
    description = details.fullName;
    extraGroups = [
      "wheel"
      "video"
      "audio"
      "input"
      "dialout"
    ];
  }) users;
}
