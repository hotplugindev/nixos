{
  lib,
  allUsers,
  ...
}:
{
  users.users = lib.mapAttrs (username: details: {
    isNormalUser = true;
    description = details.fullName;
    extraGroups = [
      "wheel"
      "video"
      "audio"
      "input"
    ];
  }) allUsers;
}
