{ pkgs, ... }:
{
  programs.nixvim = {
    extraPackages = with pkgs; [
      # useful for Avante workflows
      git
      curl
      ripgrep
      fd
    ];

    plugins = {
      avante = {
        enable = false;

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

      # keep these enabled if you already use them
      dressing.enable = true;
      web-devicons.enable = true;
      img-clip.enable = true;
      render-markdown.enable = true;
    };

    opts = {
      laststatus = 3;
    };
  };
}