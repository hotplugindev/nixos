{
  lib,
  config,
  inputs,
  ...
}:
let
  cfg = config.gb.home.programs.entertainment.sonora;
in
{
  imports = [
    inputs.sonora.homeManagerModules.default
  ];

  options = {
    gb.home.programs.entertainment.sonora = {
      enable = lib.mkEnableOption "Enable sonora music player";

      settings = lib.mkOption {
        type = lib.types.submodule {
          options = {
            provider = lib.mkOption {
              type = lib.types.str;
              default = "youtube";
              description = "Audio provider for sonora";
            };

            appearance = lib.mkOption {
              type = lib.types.submodule {
                options = {
                  theme = lib.mkOption {
                    type = lib.types.str;
                    default = "dark";
                    description = "Sonora theme";
                  };
                };
              };
              default = { };
              description = "Sonora appearance settings";
            };
          };
        };
        default = { };
        description = "Sonora settings forwarded to programs.sonora.settings";
      };
    };
  };

  config = lib.mkIf cfg.enable {
    programs.sonora = {
      enable = true;
      settings = cfg.settings;
    };
  };
}
