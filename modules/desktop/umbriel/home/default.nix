{
  lib,
  config,
  ...
}:
let
  umbriel = config.gb.home.desktop.umbriel;
in
{
  imports = [
    ./core/default.nix
    ./umbriel/default.nix
  ];

  options.gb.home.desktop.umbriel = {
    enable = lib.mkEnableOption "Enable Umbriel desktop domain";
    umbriel.enable = lib.mkEnableOption "Enable Umbriel compositor stack";
    legacy.enable = lib.mkEnableOption "Enable archived old Umbriel stack";
  };

  config = {
    assertions = [
      {
        assertion = !umbriel.legacy.enable;
        message = "`gb.home.desktop.umbriel.legacy.enable` is archived. Legacy setup is retained in the repository archive tree.";
      }
    ];

    gb.home.desktop.umbriel.umbriel.enable = lib.mkDefault umbriel.enable;
  };
}
