{
  lib,
  config,
  pkgs,
  ...
}:
let
  avante = config.gb.home.dev.nixvim.tools.avante;
in
{
  options = {
    gb.home.dev.nixvim.tools.avante.enable = lib.mkEnableOption "Enable nixvim avante tool";
  };

  config = lib.mkIf avante.enable {
    programs.nixvim = {
      extraPackages = with pkgs; [
        git
        curl
        ripgrep
        fd
      ];

      plugins = {
        avante = {
          enable = true;

          settings = {
            provider = "openai";
            auto_suggestions_provider = "copilot";

            windows = {
              width = 34;
              wrap = true;
              sidebar_header = {
                enabled = true;
                rounded = true;
                align = "center";
              };
            };

            hints = {
              enabled = true;
            };

            diff = {
              autojump = true;
              list_opener = "copen";
            };
          };
        };

        dressing.enable = true;
        web-devicons.enable = true;
        img-clip.enable = true;
        render-markdown.enable = true;
      };

      opts = {
        laststatus = 3;
      };
    };
  };
}