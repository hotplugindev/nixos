{ lib, username ? "", fullName ? "", email ? "", ... }:
{
  options.gb.user = {
    username = lib.mkOption {
      type = lib.types.str;
      default = username;
      description = "Primary username";
    };
    fullName = lib.mkOption {
      type = lib.types.str;
      default = fullName;
      description = "Primary user full name";
    };
    email = lib.mkOption {
      type = lib.types.str;
      default = email;
      description = "Primary user email";
    };
  };
}
